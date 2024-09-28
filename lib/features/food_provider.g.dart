// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodsHash() => r'7e8d9cc076340d67b0691067dd8351e18a1e9059';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [foods].
@ProviderFor(foods)
const foodsProvider = FoodsFamily();

/// See also [foods].
class FoodsFamily extends Family<AsyncValue<Data<List<Food>>>> {
  /// See also [foods].
  const FoodsFamily();

  /// See also [foods].
  FoodsProvider call({
    int offset = 0,
    int limit = 25,
  }) {
    return FoodsProvider(
      offset: offset,
      limit: limit,
    );
  }

  @override
  FoodsProvider getProviderOverride(
    covariant FoodsProvider provider,
  ) {
    return call(
      offset: provider.offset,
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'foodsProvider';
}

/// See also [foods].
class FoodsProvider extends AutoDisposeFutureProvider<Data<List<Food>>> {
  /// See also [foods].
  FoodsProvider({
    int offset = 0,
    int limit = 25,
  }) : this._internal(
          (ref) => foods(
            ref as FoodsRef,
            offset: offset,
            limit: limit,
          ),
          from: foodsProvider,
          name: r'foodsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$foodsHash,
          dependencies: FoodsFamily._dependencies,
          allTransitiveDependencies: FoodsFamily._allTransitiveDependencies,
          offset: offset,
          limit: limit,
        );

  FoodsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.offset,
    required this.limit,
  }) : super.internal();

  final int offset;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<Data<List<Food>>> Function(FoodsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FoodsProvider._internal(
        (ref) => create(ref as FoodsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        offset: offset,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Data<List<Food>>> createElement() {
    return _FoodsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodsProvider &&
        other.offset == offset &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FoodsRef on AutoDisposeFutureProviderRef<Data<List<Food>>> {
  /// The parameter `offset` of this provider.
  int get offset;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _FoodsProviderElement
    extends AutoDisposeFutureProviderElement<Data<List<Food>>> with FoodsRef {
  _FoodsProviderElement(super.provider);

  @override
  int get offset => (origin as FoodsProvider).offset;
  @override
  int get limit => (origin as FoodsProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
