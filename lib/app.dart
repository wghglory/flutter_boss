import 'package:flutter/material.dart';

import 'package:flutter_boss/screen/company.dart';
import 'package:flutter_boss/screen/job.dart';
import 'package:flutter_boss/screen/me.dart';
import 'package:flutter_boss/screen/message.dart';

class BossApp extends StatefulWidget {
  BossApp({Key key}) : super(key: key);

  @override
  _BossAppState createState() => _BossAppState();
}

class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;
  VoidCallback onChanged;
  var _widgets = [JobScreen(), CompanyScreen(), MessageScreen(), MeScreen()];

  @override
  void initState() {
    super.initState();

    _controller = new TabController(
        initialIndex: _currentIndex, length: _widgets.length, vsync: this);

    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: _widgets,
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _controller,
          labelStyle: TextStyle(fontSize: 12),
          tabs: <Widget>[
            Text('job'),
            Text('company'),
            Text('message'),
            Text('me'),
          ],
        ),
      ),
    );
  }
}