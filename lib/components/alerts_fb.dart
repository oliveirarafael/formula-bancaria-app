import 'package:flutter/material.dart';

class Alerts {
  static void information({@required String title, @required String content, @required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return _AlertDialogInformationFB(
            title: title,
            content: content,
          );
        });
  }
}

class _AlertDialogInformationFB extends StatelessWidget {
  final String title, content;

  _AlertDialogInformationFB({@required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.content),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
