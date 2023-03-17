import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {

  Color _color = Colors.greenAccent;
  late String _title;
  late String _content;
  late String _yes;
  late String _no;
  late VoidCallback _yesOnPressed;
  late VoidCallback _noOnPressed;

  BaseAlertDialog({String? title, String? content, VoidCallback? yesOnPressed, VoidCallback? noOnPressed, String yes = "Yes", String no = "No"}){
    this._title = title!;
    this._content = content!;
    this._yesOnPressed = yesOnPressed!;
    this._noOnPressed = noOnPressed!;
    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(this._title),
      content: new Text(this._content),
      backgroundColor: this._color,
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(this._yes,style: TextStyle(color: Colors.greenAccent),),
          onPressed: () {
            _yesOnPressed();
          },
        ),
        new ElevatedButton(
          child: Text(this._no,style: TextStyle(color: Colors.redAccent),),
          onPressed: () {
           _noOnPressed();
          },
        ),
      ],
    );
  }
}