import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel/marvel.dart';
import 'view.dart';
import 'package:marvel/common/common.dart' as prefix0;

/// @description 有状态的
///
/// @author 燕文强
///
/// @date 2019-12-11
abstract class Stateful<T extends StatefulWidget, P extends Presenter>
    extends State<T> with View {
  P presenter;

  P initPresenter();

  viewDidLoad(callback);

  updateState(tag, params);

  showMsg(String msg, {String title, String positiveText}) {
    prefix0.showMsg(context, msg, title: title, positiveText: positiveText);
  }

  showSnackBar(String text) {
    prefix0.showSnackBar(context, text);
  }

  @override
  void initState() {
    super.initState();
    presenter = initPresenter();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      viewDidLoad(callback);
    });
  }

  @override
  update({tag, params}) {
    setState(() => updateState(tag, params));
  }

  @override
  launch(Widget widget) {
    prefix0.launch(context, widget);
  }

  @override
  BuildContext getContext() => this.context;
}
