import 'package:flutter/material.dart';

import 'package:flutter_boss/component/tab-item.dart';

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

    _controller = TabController(
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
            IconTabItem(
              icon: _currentIndex == 0
                  ? 'assets/images/ic_main_tab_find_pre.png'
                  : 'assets/images/ic_main_tab_find_nor.png',
              text: 'Job',
              color: _currentIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            IconTabItem(
              icon: _currentIndex == 1
                  ? 'assets/images/ic_main_tab_company_pre.png'
                  : 'assets/images/ic_main_tab_company_nor.png',
              text: 'Company',
              color: _currentIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            IconTabItem(
              icon: _currentIndex == 2
                  ? 'assets/images/ic_main_tab_contacts_pre.png'
                  : 'assets/images/ic_main_tab_contacts_nor.png',
              text: 'Message',
              color: _currentIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            IconTabItem(
              icon: _currentIndex == 3
                  ? 'assets/images/ic_main_tab_my_pre.png'
                  : 'assets/images/ic_main_tab_my_nor.png',
              text: 'Me',
              color: _currentIndex == 3
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
