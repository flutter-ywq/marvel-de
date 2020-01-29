import 'package:flutter/material.dart';

/// @description 页面相关的方法
///
/// @author 燕文强
///
/// @date 2019-12-13
void launch(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ),
  );
}

showSnackBar(BuildContext context, String text) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1500),
      content: Text(text),
    ),
  );
}
