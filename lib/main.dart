import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdystep/home.dart';
import 'package:tdystep/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Store(),
      child: MaterialApp(
        title: 'tdy-step',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
