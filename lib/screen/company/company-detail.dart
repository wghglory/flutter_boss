import 'package:flutter/material.dart';

import 'package:flutter_boss/model/company.dart';
import 'package:flutter_boss/component/carousel.dart';

import 'company-detail-hotjob.dart';
import 'company-detail-inc.dart';
import 'company-detail-info.dart';

const double _kAppBarHeight = 256.0;

class CompanyDetail extends StatefulWidget {
  final Company _company;

  CompanyDetail(this._company);

  @override
  CompanyDetailState createState() => new CompanyDetailState();
}

class CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {
  List<Widget> _imagePages;
  List<String> _urls = [
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20170725/861159df793857d6cb984b52db4d4c9c.jpg',
    'https://img2.bosszhipin.com/mcs/chatphoto/20151215/a79ac724c2da2a66575dab35384d2d75532b24d64bc38c29402b4a6629fcefd6_s.jpg',
    'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180207/c15c2fc01c7407b98faf4002e682676b.jpg'
  ];

  List<Tab> _tabs;
  TabController _controller;
  Widget _companyTabContent;
  VoidCallback onChanged;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    if (_urls.isNotEmpty) {
      _imagePages = <Widget>[];

      _urls.forEach((String url) {
        _imagePages.add(new Container(
          color: Colors.black.withAlpha(900),
          child: new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: new Image.network(
              url,
              fit: BoxFit.cover,
              height: _kAppBarHeight,
            ),
          ),
        ));
      });
    }

    //初始化tab
    _tabs = [
      new Tab(
        text: '公司概况',
      ),
      new Tab(
        text: '热招职位',
      )
    ];

    _companyTabContent = new CompanyDetailInc(widget._company.inc);
    _controller = new TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      setState(() {
        if (currentIndex == 0) {
          _companyTabContent = new CompanyDetailInc(widget._company.inc);
        } else {
          _companyTabContent = new CompanyDetailHotJob();
        }

        currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: new Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                SizedBox.fromSize(
                  size: const Size.fromHeight(_kAppBarHeight),
                  child: new Carousel(pages: _imagePages),
                ),
                Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new CompanyDetailInfo(widget._company),
                      new Divider(),
                      new TabBar(
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: new TextStyle(fontSize: 16.0),
                        labelColor: Colors.black,
                        controller: _controller,
                        tabs: _tabs,
                        indicatorColor: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
                _companyTabContent
              ],
            ),
          ),

          //返回按钮
          new Positioned(
            top: 10.0,
            left: -10.0,
            child: new Container(
              padding: const EdgeInsets.all(15.0),
              child: new BackButton(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
