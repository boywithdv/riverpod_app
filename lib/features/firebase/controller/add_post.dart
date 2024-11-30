import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../api_client/model/firebase/post.dart';

class AddPost {
  final db = FirebaseFirestore.instance;

  Future<void> addPost(Post post) async {
    await db.collection('posts').add({
      'id':post.id,
      'title': post.title,
      'content': post.content,
      'createdAt': post.createdAt,
    });
  }
}