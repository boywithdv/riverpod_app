import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String title;
  final String content;
  final Timestamp createdAt;
  
    Post({
      required this.id,
      required this.title,
      required this.content,
      required this.createdAt,
    });
  
    factory Post.fromDocument(DocumentSnapshot doc) {
      return Post(
        id: doc.id,
        title: doc['title'],
        content: doc['content'],
        createdAt: doc['createdAt'],
      );
    }
  
    Map<String, dynamic> toDocument() {
      return {
        'id': id,
        'title': title,
        'content': content,
        'createdAt': createdAt,
      };
    }
}