import 'package:flutter/material.dart';

class MeScreen extends StatefulWidget {
  MeScreen({Key key}) : super(key: key);

  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
        padding: const EdgeInsets.only(top: 180.0),
        child: Column(
          children: <Widget>[
            Text(
              'Me',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
