import 'package:flutter/material.dart';
import 'package:riverpod_app/pages/firebase_page/firebase_page.dart';
import 'package:riverpod_app/pages/firebase_page/firebase_paging_provider_page.dart';


class FirebaseListPage extends StatelessWidget {
  const FirebaseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const FirebasePage(),
                ));
              }, 
              child: Text('Firebase Refresh Page')
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const FirebasePagingProviderPage(),
                ));
              } , 
              child: Text('Firebase Paging Provider Page')
            ),
          ],
        ),
      ),
    );
  }
}