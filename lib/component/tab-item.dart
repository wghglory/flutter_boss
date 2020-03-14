import 'package:flutter/material.dart';

class IconTabItem extends StatefulWidget {
  final String text;
  final String icon;
  final Color color;

  IconTabItem({this.text, this.icon, this.color});

  @override
  _IconTabItemState createState() => _IconTabItemState();
}

class _IconTabItemState extends State<IconTabItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          height: 54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(widget.icon),
                  height: 30,
                  width: 30,
                ),
                margin: EdgeInsets.only(bottom: 2),
              ),
              Text(
                widget.text,
                softWrap: false,
                style: TextStyle(color: widget.color),
              )
            ],
          )),
    );
  }
}
