import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter/material.dart';
import 'package:flutter_boss/model/friend.dart';

class FriendListScreen extends StatefulWidget {
  FriendListScreen({Key key}) : super(key: key);

  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  List<Friend> _friends = [];

  HttpClient httpClient = new HttpClient();
  String url = 'https://randomuser.me/api/?results=40';

  @override
  void initState() {
    super.initState();

    _loadFriendList();
  }

  _loadFriendList() async {
    HttpClientRequest req = await httpClient.getUrl(Uri.parse(url));

    HttpClientResponse res = await req.close();

    if (res.statusCode == HttpStatus.ok) {
      String jsonString = await res.transform(utf8.decoder).join();

      if (mounted) {
        setState(() {
          _friends = Friend.resolveData(jsonString);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text(
        'Friend List',
        style: TextStyle(color: Colors.white),
      )),
      body: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    var content;

    if (_friends.isEmpty) {
      content = new CircularProgressIndicator();
    } else {
      content = ListView.builder(
        itemBuilder: _buildFriendItem,
        itemCount: _friends.length,
      );
    }

    return content;
  }

  Widget _buildFriendItem(BuildContext ctx, int i) {
    var friend = _friends[i];

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatar),
      ),
      title: Text(friend.name),
      subtitle: Text(friend.email),
    );
  }
}
