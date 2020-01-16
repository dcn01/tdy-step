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
      body: Snap(
          child: Image.network(
        'https://norefer.oss.dcdcdog.com/12120.jpg',
        fit:BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      )),
    );
  }
}
