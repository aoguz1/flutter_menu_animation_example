import 'package:flutter/material.dart';

class FlatTexting extends StatelessWidget {
  String title;
  FlatTexting({
    Key key,
    this.title,
  }) : super(key: key);



  final textStyleMenu = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: () {}, child: Text(title,style: textStyleMenu,));
  }
}
