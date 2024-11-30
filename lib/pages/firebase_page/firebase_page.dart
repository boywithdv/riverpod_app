import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/firebase/controller/add_post.dart';
import 'package:riverpod_app/pages/firebase_page/firebase_post_list_tile.dart';
import 'package:riverpod_app/widgets/appbar/appbar.dart';
import 'package:riverpod_app/widgets/async_value_body/async_value_body.dart';

import '../../api_client/model/firebase/post.dart';
import '../../features/firebase/post/posts_provider.dart';

class FirebasePage extends HookConsumerWidget {
  const FirebasePage({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: PrimaryAppBar(),
      body: AllPostView(),
      floatingActionButton: _AddPostFloatingActionButton()
    );
  }
}



class AllPostView extends HookConsumerWidget {
  const AllPostView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final post = ref.watch(postsProvider);
    return AsyncValueBody(
      post,
      asyncValue: (posts) {
        return RefreshIndicator(
          onRefresh: (){
            return ref.refresh(postsProvider.future);
          },
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return FirebasePostListTile(
                title: post.title,
                content:post.content,
              );
            },
          ),
        );
      },
    );
  }
}


/// 投稿を追加するFloatingActionButton
class _AddPostFloatingActionButton extends StatelessWidget {
  const _AddPostFloatingActionButton();

  @override
  Widget build(BuildContext context) {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
    return FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(context: context, builder: (context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      labelText: 'Content',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final post = Post(
                        id: '', // Firestoreが自動生成するため空文字列
                        title: titleController.text,
                        content: contentController.text,
                        createdAt: Timestamp.now(),
                      );

                      final addPost = AddPost();
                      await addPost.addPost(post);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Post added successfully')),
                      );
                    },
                    child: Text('Add Post'),
                  ),
                ],
              ),
            );
          });
        },
        child: Icon(Icons.add),
      );
  }
}