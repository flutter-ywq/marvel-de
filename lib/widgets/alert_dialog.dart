import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @description AlertDialog
///
/// @author 燕文强
///
/// @date 2020/3/5
class AlertDialog {
  // 上下文
  final BuildContext context;

  // 标题
  final String title;

  // 内容
  final String content;

  // 左按钮文本
  final String negativeText;

  // 右按钮文本
  final String positiveText;

  // 取消响应
  final Function negativePressEvent;

  // 确定响应
  final Function positivePressEvent;

  AlertDialog({
    @required this.context,
    this.title,
    this.content,
    this.negativeText,
    this.positiveText,
    this.negativePressEvent,
    @required this.positivePressEvent,
  }) {
    showDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title == null
              ? null
              : Text(
            title,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          content: content == null
              ? null
              : Text(
            content,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: negativePressEvent == null ? oneWidget() : twoWidget(),
        );
      },
    );
  }

  oneWidget() {
    return [
      CupertinoDialogAction(
        child: Text(
          positiveText ?? '确定',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          positivePressEvent();
        },
      ),
    ];
  }

  twoWidget() {
    return [
      CupertinoDialogAction(
        child: Text(
          negativeText ?? '取消',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          negativePressEvent();
        },
      ),
      CupertinoDialogAction(
        child: Text(
          positiveText ?? '确定',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          positivePressEvent();
        },
      ),
    ];
  }
}
