import 'package:flutter/material.dart';

/// @description MessageDialog
///
/// @author 燕文强
///
/// @date 2020-01-29
// ignore: must_be_immutable
class MessageDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function positivePressEvent;
  Function negativePressEvent;

  MessageDialog({
    Key key,
    this.title = '',
    this.message = '',
    this.negativeText = '',
    this.positiveText = '',
    this.positivePressEvent,
    this.negativePressEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = title.isNotEmpty ? 25 : 5;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(padding),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        Center(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(minHeight: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 35, left: 13, right: 13),
                      child: IntrinsicHeight(
                        child: Text(
                          message,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  this._buildBottomButtonGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty)
      widgets.add(_buildBottomButton(negativeText, negativePressEvent));
    if (positiveText != null && positiveText.isNotEmpty)
      widgets.add(_buildBottomButton(positiveText, positivePressEvent));
    return Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomButton(String text, Function event) {
    return Flexible(
      fit: FlexFit.tight,
      child: FlatButton(
        padding: EdgeInsets.all(17),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        onPressed: event,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
