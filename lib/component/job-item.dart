import 'package:flutter/material.dart';
import 'package:flutter_boss/model/job.dart';

class JobItem extends StatelessWidget {
  final Job job;

  JobItem(this.job);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: SizedBox(
          child: Card(
            elevation: 0, // shadow size
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 10, bottom: 5),
                            child: Text(job.name),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(job.salary,
                                      style: TextStyle(color: Colors.red)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Text(
                          job.cname + ' ' + job.size,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                        margin: const EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          bottom: 5.0,
                        ),
                      ),
                      Divider(), //分割线
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 10.0,
                              right: 5.0,
                              bottom: 15.0,
                            ),
                            child: Text(
                              job.username + ' | ' + job.title,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 215, 198),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
