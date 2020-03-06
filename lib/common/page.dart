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

void showMsg(BuildContext context, String msg, {String title, String positiveText}) {
  msg = msg ?? '';
  title = title ?? '';
  positiveText = positiveText ?? '确定';
//  MessageDialog.show(context: context, title: title, positiveText: positiveText,message: msg);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return MessageDialog(
        title: title,
        message: msg,
        positiveText: positiveText,
        positivePressEvent: () {
          Navigator.pop(context);
        },
      );
    },
  );
}

void showMsg2(BuildContext context, String msg, {String title, String positiveText}) {
  msg = msg ?? '';
  positiveText = positiveText ?? '确定';
  MessageDialog.show(context: context, title: title, positiveText: positiveText, message: msg);
}
