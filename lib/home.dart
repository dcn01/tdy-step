import 'package:flutter/material.dart';
import 'package:tdystep/pages/provider-test.dart';

class Home extends StatelessWidget {
  final List<Map<String, dynamic>> pages = [
    {'name': 'provider使用', 'route': () => ProviderTest()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tdy-step'),),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 0,
            crossAxisSpacing: 25,
            childAspectRatio: 1,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          shrinkWrap: true,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => pages[index]['route'](),
                      ));
                },
                child: Center(
                  child: Text(pages[index]['name']),
                ));
          }),
    );
  }
}
