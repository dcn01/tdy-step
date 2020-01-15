import 'package:flutter/material.dart';

class BotItemClip extends StatefulWidget {
  @override
  _BotItemClipState createState() => _BotItemClipState();
}

class _BotItemClipState extends State<BotItemClip> {
  var pageCon = PageController(), page;

  @override
  void initState() {
    super.initState();
    pageCon.addListener(() {
      setState(() {
        page = pageCon.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(page.toString()),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: PageView(
                    controller: pageCon,
                    children: List<Widget>.generate(
                      3,
                      (_) => Container(
                        color: Colors.blue,
                        child: Center(child: Text("$_")),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: ClipRect(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(child: Container(color: Colors.redAccent)),
                        Expanded(child: Container(color: Colors.yellow)),
                        Expanded(child: Container(color: Colors.green)),
                      ],
                    ),
                    clipper: CustomIndicatorClipper( page??0),
                    clipBehavior: Clip.antiAlias,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIndicatorClipper extends CustomClipper<Rect> {
  final double page;

  const CustomIndicatorClipper(this.page);

  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTRB(
      page * size.width / 3,
      0.0,
      size.width / 3 + page * size.width / 3,
      size.height,
    );
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
