import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api_client/model/firebase/post.dart';

// 投稿一覧を取得するプロバイダ
final postsProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('posts').orderBy('createdAt',descending: true).limit(3).get();
  return snapshot.docs.map((doc)=>Post.fromDocument(doc)).toList();
});


final postsListProvider = StateNotifierProvider<PostsNotifier, List<Post>>((ref) => PostsNotifier());


class PostsNotifier extends StateNotifier<List<Post>> {
  PostsNotifier():super([]);

  // 現在取得している最後のドキュメントを保持する
  DocumentSnapshot? _lastDocument;

  // 最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirstPosts() async {
    final snapshot = await FirebaseFirestore.instance.collection('posts').orderBy('createdAt',descending: true).limit(3).get();
    state = snapshot.docs.map((doc)=>Post.fromDocument(doc)).toList();
    _lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
  }

  // 追加で表示するためのドキュメントを読み込む
  Future<void> fetchPosts() async {
    if(_lastDocument == null) return;
    final snapshot = await FirebaseFirestore.instance.collection('posts').orderBy('createdAt',descending: true).startAfterDocument(_lastDocument!).limit(3).get();
    state = [...state, ...snapshot.docs.map((doc)=>Post.fromDocument(doc)).toList()];
    _lastDocument = snapshot.docs.isNotEmpty ? snapshot.docs.last : null;
  }

  void addPost(Post post) {
    state = [...state, post];
  }
}