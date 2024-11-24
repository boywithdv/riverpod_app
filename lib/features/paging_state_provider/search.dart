
// ignore: undefined_hidden_name
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'detail.dart';
import 'pub_repository.dart';

part 'search.g.dart';

const packagesPackageSize = 10;
const searchPageSize = 10;

@riverpod
Future<List<Package>> fetchPackages(
  Ref ref, {
  required int page,
  String search = '',
}) async {
  assert(page > 0, 'page offset starts at 1');
  final cancelToken = ref.cancelToken();

  if (search.isEmpty) {
    return ref
        .watch(pubRepositoryProvider)
        .getPackages(page: page, cancelToken: cancelToken);
  }

  // Debouncing searches by delaying the request.
  // If the search was cancelled during this delay, the network request will
  // not be performed.
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (cancelToken.isCancelled) {
    throw Exception('cancelled');
  }

  final searchedPackages = await ref
      .watch(pubRepositoryProvider)
      .searchPackages(page: page, search: search, cancelToken: cancelToken);

  return Future.wait([
    for (final package in searchedPackages)
      ref.watch(
        fetchPackageDetailsProvider(packageName: package.package).future,
      ),
  ]);
}

