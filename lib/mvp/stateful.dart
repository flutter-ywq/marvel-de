import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel/marvel.dart';
import 'package:marvel/utils/logger.dart';
import 'view.dart';
import 'package:marvel/common/common.dart' as prefix0;

/// @description 有状态的
///
/// @author 燕文强
///
/// @date 2019-12-11
abstract class Stateful<T extends StatefulWidget, P extends Presenter> extends State<T> with View, WidgetsBindingObserver {
  bool bindingObserver = false;

  P presenter;

  P initPresenter();

  viewDidLoad(callback);

  updateState(tag, params);

  showMsg(String msg, {String title, String positiveText}) {
    prefix0.showMessage(context, msg, title: title, positiveText: positiveText);
  }

  void toast(String msg, {int gravity = 1}) {
    prefix0.toast(context, msg, gravity: gravity);
  }

  showSnackBar(String text) {
    prefix0.showSnackBar(context, text);
  }

  @override
  void initState() {
    super.initState();
    if (bindingObserver) {
      logFormat('bind WidgetsBindingObserver');
      WidgetsBinding.instance.addObserver(this);
    }
    presenter = initPresenter();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      viewDidLoad(callback);
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (bindingObserver) {
      logFormat('remove WidgetsBindingObserver');
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  update({tag, params}) {
    setState(() => updateState(tag, params));
  }

  @override
  Future launch(Widget widget) {
    return prefix0.launch(context, widget);
  }

  @override
  Future launchAndCloseSelf(Widget widget) {
    return prefix0.launchAndCloseSelf(context, widget);
  }

  @override
  BuildContext getContext() => this.context;

  @override
  void didChangeAccessibilityFeatures() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    log('lifecycle changed: $state');
  }

  @override
  void didChangeLocales(List<Locale> locale) {}

  @override
  void didChangeMetrics() {}

  @override
  void didChangePlatformBrightness() {}

  @override
  void didChangeTextScaleFactor() {}

  @override
  void didHaveMemoryPressure() {}
}
