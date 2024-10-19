import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/features.dart';



class ComsumerWidgetSample extends StatelessWidget {
  const ComsumerWidgetSample({super.key});

  Future<void> showTallRoomOpenDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, child) {
            return AlertDialog(
              title: Text('Tall Room Open'),
              content: Text('Tall Room Open'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('consumer'),),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final appName = ref.watch(appNameProvider);
            return InkWell(
              onTap: () {
                showTallRoomOpenDialog(context);
              },
              child: Text(
                appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          },
        )
      ),
    );
  }
}