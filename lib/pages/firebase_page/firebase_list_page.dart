import 'package:flutter/material.dart';


class FirebaseListPage extends StatelessWidget {
  const FirebaseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: (){

          }, 
          child: Text('Firebase Refresh Page')
        ),
        ElevatedButton(
          onPressed:(){} , 
          child: Text('Firebase Paging Provider Page')
        ),
      ],
    );
  }
}