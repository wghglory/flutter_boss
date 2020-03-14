import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  CompanyScreen({Key key}) : super(key: key);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Company Page'),
    );
  }
}
