import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boss/model/company.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; // https://pub.dev/packages/pull_to_refresh

import 'company-detail.dart';
import 'company-item.dart';

/* pull to refresh package */

class CompanyListScreen extends StatefulWidget {
  CompanyListScreen({Key key}) : super(key: key);

  @override
  _CompanyListScreenState createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen> {
  List<Company> _companies = [];

  @override
  void initState() {
    super.initState();

    _getCompanyList();
  }

  void _getCompanyList() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/company.json');

    if (mounted) {
      setState(() {
        _companies = Company.fromJson(jsonString);
      });
    }
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Company',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.find_in_page,
              color: Colors.white,
            ),
            onPressed: () {
              print('on search click');
            },
          )
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemCount: _companies.length,
          itemBuilder: (context, index) {
            return _buildCompanyItem(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCompanyItem(BuildContext context, int index) {
    // Company company = _companies[index];
    // return Text(company.name);

    Company company = _companies[index];

    var companyItem = InkWell(
      onTap: () => {_navCompanyDetail(company, index)},
      child: CompanyItem(company),
    ); // ListTile also works

    return companyItem;
  }

  // 跳转详情页
  _navCompanyDetail(Company company, int index) {
    // Navigator.push(
    //   context,
    //   new MaterialPageRoute(
    //     builder: (context) => new CompanyDetail(company),
    //   ),
    // );

    Navigator.of(context).push(
      new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return CompanyDetail(company);
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(
                position: new Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child),
          );
        },
      ),
    );
  }
}
