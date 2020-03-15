import 'package:flutter/material.dart';
import 'package:flutter_boss/model/job.dart';

import 'job-item.dart';

class JobScreen extends StatefulWidget {
  JobScreen({Key key}) : super(key: key);

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();

    _getJobList();
  }

  void _getJobList() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/job.json');

    setState(() {
      _jobs = Job.fromJson(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Job List',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: new ListView.builder(
          itemCount: _jobs.length,
          itemBuilder: _buildJobItem,
        ),
      ), // Default refresh when dragging down
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
    });
  }

  Widget _buildJobItem(BuildContext ctx, int i) {
    Job job = _jobs[i];

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          child: AlertDialog(
            content: Text('敬请期待！', style: TextStyle(fontSize: 20.0)),
          ),
        );
      },
      child: JobItem(job),
    );
  }
}
