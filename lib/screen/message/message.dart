import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 0, 215, 198),
      child: Padding(
        padding: const EdgeInsets.only(top: 180.0),
        child: Column(
          children: <Widget>[
            Text(
              'Message',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              child: _companyIntroduction(),
            ),
            Container(
              child: _richText(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _richText() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: '敬请期待',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: '敬请期待',
                    style: TextStyle(fontSize: 16.0, color: Colors.red),
                  ),
                  TextSpan(
                    text: '敬请期待',
                    style: TextStyle(fontSize: 20.0, color: Colors.blue),
                  )
                ]),
          )
        ],
      ),
    );
  }

  Widget _companyIntroduction() {
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
                  )
                ],
              ),
              RichText(
                text: TextSpan(
                    text:
                        'VMware is a great company! I love OSE team! Keep the best merit!',
                    style: TextStyle(fontSize: 13.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
