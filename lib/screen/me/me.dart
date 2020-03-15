import 'package:flutter/material.dart';

/* demo passing data by grand components */

class MeScreen extends StatefulWidget {
  MeScreen({Key key}) : super(key: key);

  @override
  _MeScreenState createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 242, 245),
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text(
            'Me',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        body: MiddleLayer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

// papa
class MiddleLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

// son
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取CounterProvider提供的数据
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;

    return Center(
      child: GestureDetector(
        onTap: increaseCount,
        child: Text(
          '$count',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

// grandpa
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child});

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  // 决定是否重建新的小部件
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
