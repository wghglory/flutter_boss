import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //主题相关

class CompanyDetailInc extends StatelessWidget {
  final String _companyDetailInc;

  CompanyDetailInc(this._companyDetailInc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Text('公司介绍', style: TextStyle(fontSize: 15.0)),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: _companyDetailInc,
                  style: TextStyle(fontSize: 13.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
