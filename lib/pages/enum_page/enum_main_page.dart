import 'package:flutter/material.dart';
import 'package:riverpod_app/widgets/button/button.dart';

import '../../widgets/button/app_button_type.dart';


class EnumMainPage extends StatelessWidget {
  const EnumMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enum Main Page'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            AppButton(buttonType: AppButtonType.AddButton,onPressed: (){
              print('On Tap :' + AppButtonType.AddButton.text(context));
            },),
            AppButton(buttonType: AppButtonType.UpdateButton,onPressed: (){
              print('On Tap :' + AppButtonType.UpdateButton.text(context));
            },),
            AppButton(buttonType: AppButtonType.ReadButton,onPressed: (){
              print('On Tap :' + AppButtonType.ReadButton.text(context));
            },),
            AppButton(buttonType: AppButtonType.DeleteButton,onPressed: (){
              print('On Tap :' + AppButtonType.DeleteButton.text(context));
            },),
        ],
      )),
    );
  }
}