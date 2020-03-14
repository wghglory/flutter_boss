import 'package:flutter/material.dart';

class MeScreen extends StatefulWidget {
  MeScreen({Key key}) : super(key: key);

  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Me Page'),
    );
  }
}
