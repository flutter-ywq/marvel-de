import 'package:flutter/cupertino.dart';

/// @description View
///
/// @author 燕文强
///
/// @date 2019-12-11
mixin View {
  showMsg(String msg, {String title});

  update({tag, params});

  launch(Widget widget);

  BuildContext getContext();
}
