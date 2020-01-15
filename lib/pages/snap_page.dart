import 'package:flutter/material.dart';
import 'package:tdystep/utils/snap.dart';

class SnapPage extends StatefulWidget {
  @override
  _SnapPageState createState() => _SnapPageState();
}

class _SnapPageState extends State<SnapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Snap(
            child: Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
          child: Text('将html转成canvas，为后面处理做准备。这里我们使用html2canvas库，可以将html中的dom节点绘制成canvas'),
        )),
      ),
    );
  }
}
