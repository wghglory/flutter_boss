import 'package:flutter/material.dart';
import 'package:flutter_boss/model/company.dart';

class CompanyScreen extends StatefulWidget {
  CompanyScreen({Key key}) : super(key: key);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  List<Company> _companies = [];

  @override
  void initState() {
    super.initState();

    _getCompanyList();
  }

  void _getCompanyList() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/company.json');

    setState(() {
      _companies = Company.fromJson(jsonString);
    });
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
      body: ListView.builder(
          itemCount: _companies.length,
          itemBuilder: (context, index) {
            return _buildCompanyItem(context, index);
          }),
    );
  }

  Widget _buildCompanyItem(BuildContext context, int index) {
    Company company = _companies[index];
    return Text(company.name);
  }
}
