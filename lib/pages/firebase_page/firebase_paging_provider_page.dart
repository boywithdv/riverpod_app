import 'package:flutter/material.dart';


class FirebasePagingProviderPage extends StatefulWidget {
  const FirebasePagingProviderPage({super.key});

  @override
  State<FirebasePagingProviderPage> createState() => _FirebasePagingProviderPageState();
}

class _FirebasePagingProviderPageState extends State<FirebasePagingProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Paging Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Firebase Paging Provider Page',
            ),
          ],
        ),
      ),
    );
  }
}