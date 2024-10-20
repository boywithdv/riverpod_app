import 'package:flutter/material.dart';


enum AppButtonType {
  AddButton(height: 56,width: 100,borderRadius:10),
  UpdateButton(height: 56,width: 100,borderRadius:10),
  ReadButton(height: 56,width: 100,borderRadius:10),
  DeleteButton(height: 56,width: 100,borderRadius:10),
  AppButton(height: 56,width: 100,borderRadius: 10),
  ;

  const AppButtonType({
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  /// ボタンの高さ
  final double height;
  
  /// ボタンの横幅
  final double width;

  /// ボタンの角丸の半径
  final double borderRadius;

  /// ボタンに表示するテキストを取得する。
  String text(BuildContext context){
    return switch(this){
      AppButtonType.AddButton => 'Add',
      AppButtonType.UpdateButton => 'Update',
      AppButtonType.ReadButton => 'Read',
      AppButtonType.DeleteButton => 'Delete',
      AppButtonType.AppButton => 'AppButton',
    };
  }

  /// ボタンのテキストスタイルを取得する。
  TextStyle? textStyle(BuildContext context){
    return switch(this){
      AppButtonType.AddButton => TextStyle(color: Colors.red,),
      AppButtonType.UpdateButton => TextStyle(color:Colors.blue,),
      AppButtonType.ReadButton => TextStyle(color:Colors.green,),
      AppButtonType.DeleteButton => TextStyle(color:Colors.yellow,),
      AppButtonType.AppButton => TextStyle(color:Colors.tealAccent,),
    };
  }

  Color? backgroundColor(BuildContext context){
    return switch(this){
      AppButtonType.AddButton => Colors.yellow,
      AppButtonType.UpdateButton => Colors.brown,
      AppButtonType.ReadButton => Colors.black,
      AppButtonType.DeleteButton => Colors.red,
      AppButtonType.AppButton => Colors.blue,
    };
  }

  BorderSide? borderSide(BuildContext context){
      if(this == AppButtonType.ReadButton){
        // readButtonのみグリーンにする。
        return BorderSide(color:Colors.green,);
      }
      return null;
  }
}

