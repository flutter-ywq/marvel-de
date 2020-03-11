import 'package:flutter/cupertino.dart';

/// @description View
///
/// @author 燕文强
///
/// @date 2019-12-11
mixin View {
  showMsg(String msg, {String title, String positiveText});

  void toast(String msg, {int gravity = 1});

  update({tag, params});

  Future launch(Widget widget);

  Future launchAndCloseSelf(Widget widget);

  BuildContext getContext();
}
