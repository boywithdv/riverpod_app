import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_client/model/firebase/post.dart';

// 投稿一覧を取得するプロバイダ
final postListProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('posts').orderBy('createdAt',descending: true).get();
  return snapshot.docs.map((doc)=>Post.fromDocument(doc)).toList();
});