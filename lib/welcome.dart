import 'dart:async';
import 'package:flutter/material.dart';

import 'app.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Timer timer;
  @override
  void initState() {
    super.initState();

    timer = new Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) => new BossApp()),
          (Route route) => route == null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: Center(
        child: new Text(
          'BOSS直聘',
          style: TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
