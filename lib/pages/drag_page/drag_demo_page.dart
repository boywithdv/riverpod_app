import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var position = const Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgetを自由に動かしたい'),
      ),
      body: GestureDetector(
        // ドラッグのスタートをタップした直後に設定
        dragStartBehavior: DragStartBehavior.down,
        onPanUpdate: (dragUpdateDetails) {
          position = dragUpdateDetails.localPosition;
          setState(() {});
        },
        child: Stack(
          children: [
            Positioned(
              // 左上からどれだけ右にあるか
              left: position.dx,
              // 左上からどれだけ下にあるか
              top: position.dy,
              child: const FlutterLogo(
                size: 80,
              ),
            ),
            Container(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
