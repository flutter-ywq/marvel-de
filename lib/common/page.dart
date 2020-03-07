import 'package:flutter/material.dart';
import 'package:marvel/widgets/message_dialog.dart';

/// @description 页面相关的方法
///
/// @author 燕文强
///
/// @date 2019-12-13
Future launch(BuildContext context, Widget widget) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Scaffold(body: widget);
  }));
}

Future launchAndCloseSelf(BuildContext context, Widget widget) {
  return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Scaffold(body: widget)), (_) => false);
}

showSnackBar(BuildContext context, String text) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1500),
      content: Text(text),
    ),
  );
}

void showMessage(
  BuildContext context,
  String message, {
  String title,
  String positiveText = '确定',
  String negativeText,
  Function positivePressEvent,
  Function negativePressEvent,
  bool barrierDismissible = false,
}) {
  message = message ?? '';
  MessageDialog.show(
    context: context,
    title: title,
    message: message,
    positiveText: positiveText,
    negativeText: negativeText,
    positivePressEvent: positivePressEvent,
    negativePressEvent: negativePressEvent,
    barrierDismissible: barrierDismissible,
  );
}
