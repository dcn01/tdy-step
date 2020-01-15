import 'package:flutter/material.dart';
import 'package:tdystep/pages/bot-item-clip.dart';
import 'package:tdystep/pages/provider-test.dart';
import 'package:tdystep/pages/snap_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> pages = [
    {'name': 'provider1', 'route': () => ProviderTest()},
    {'name': '底部item clip', 'route': () => BotItemClip()},
    {'name': '灭霸', 'route': () => SnapPage()},
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SnapPage(),
        ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tdy-step'),
      ),
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
