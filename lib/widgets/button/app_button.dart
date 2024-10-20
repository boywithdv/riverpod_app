import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'app_button_type.dart';

/// [AppButtonType]によって、ラベル・背景色・テキストスタイルなどが変わるボタン
class AppButton extends StatefulWidget {
    const AppButton({super.key,this.onPressed,required this.buttonType});

    /// ボタンが押された時のコールバック
    final VoidCallback? onPressed;

    /// ボタンの種類
    final AppButtonType buttonType;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {

    bool isPressed = false;

    @override
    Widget build(BuildContext context) {
        return AnimatedScale(
      scale: isPressed ? .97 : 1,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: () {
            if (widget.onPressed != null) {
                setState(() {
                isPressed = true;
            });
            Future.delayed(const Duration(milliseconds: 50)).then((value) {
                setState(() {
                    isPressed = false;
                });
                widget.onPressed!();
            });
            }
        },
        onTapDown: (_) {
          if (widget.onPressed != null) {
            setState(() {
              isPressed = true;
            });
          }
        },
        onTapUp: (_) {
          if (widget.onPressed != null) {
            setState(() {
              isPressed = false;
            });
          }
        },
        onTapCancel: () {
          if (widget.onPressed != null) {
            setState(() {
              isPressed = false;
            });
          }
        },
        child:  FilledButton(
                style: FilledButton.styleFrom(
                    // ボタンの高さを変更する。
                    minimumSize: Size.fromHeight(widget.buttonType.height),
                    // 背景色を変更する。
                    backgroundColor: widget.buttonType.backgroundColor(context),
                    // Borderを設定する。
                    side: widget.buttonType.borderSide(context),
                    // ボタンの角丸を設定する。
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(widget.buttonType.borderRadius)
                    ),
                ),
                onPressed: widget.onPressed, 
                child: Row(
                    children: [
                        Gap(30),
                        Icon(Icons.navigate_next),
                        Gap(10),
                        Text(widget.buttonType.text(context),style: widget.buttonType.textStyle(context),),
                    ],
                ),
        )
      ),
    );
    }
}