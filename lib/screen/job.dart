import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  JobScreen({Key key}) : super(key: key);

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Job Page'),
    );
  }
}
