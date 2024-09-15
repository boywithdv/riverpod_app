import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entries/item.dart';

/// StreamProvider - FutureProviderと同じようなことができる
/// 使用例としては以下
/// FirebaseCloudFirestoreで取得できるsnapshotをリアルタイムで取得する
/// 

/// Providerの宣言
final itemStreamProvider = StreamProvider<List<Item>>((ref) {
  return FirebaseFirestore.instance.collection('items').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Item(
        id: doc.id,
        name: data['name'] as String,
        price: data['price'] as int,
      );
    }).toList();
  });
});





