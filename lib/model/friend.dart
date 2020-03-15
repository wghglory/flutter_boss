import 'package:flutter/material.dart';
import 'dart:convert';

class Friend {
  @required
  final String avatar;
  @required
  final String name;
  @required
  final String email;

  Friend({this.avatar, this.name, this.email});

  static List<Friend> resolveData(String jsonString) {
    var json = jsonDecode(jsonString);
    var list = json['results'];

    return list
        .map((item) => new Friend(
            name: '${item['name']['first']} ${item['name']['last']}',
            avatar: item['picture']['large'],
            email: item['email']))
        .toList()
        .cast<Friend>();
  }
}
