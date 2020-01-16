import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';
import 'package:image/image.dart' as image;

class Snap extends StatefulWidget {
  final Widget child;
  Snap({this.child});
  @override
  _SnapState createState() => _SnapState();
}

class _SnapState extends State<Snap> {
  var imgs = [], gKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // 延迟3秒,等图片加载好
    Future.delayed(Duration(seconds: 3), snap);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (imgs.length == 0)
        RepaintBoundary(
          key: gKey,
          child: widget.child,
        ),
      if (imgs.length != 0) ...[
        // 加这个挡下,不然会白屏一下
        AnimatorSet(
            animationType: AnimationType.once,
            child: widget.child,
            animatorSet: [
              Serial(
                  duration: 3000,
                  serialList: [O(from: 1, to: 0, curve: Curves.linear)]),
            ]),
        ...imgs
            .map<Widget>((item) => AnimatorSet(
                    animationType: AnimationType.once,
                    child: Image.memory(item),
                    animatorSet: [
                      Serial(
                          duration: Random().nextInt(6000) + 1000,
                          serialList: [
                            TY(
                                from: 0,
                                to: -200.0 - Random().nextInt(200),
                                curve: Curves.easeInCirc),
                            TX(
                                from: 0,
                                to: 200.0 + Random().nextInt(200),
                                curve: Curves.easeInCirc),
                            O(from: 1, to: 0, curve: Curves.linear)
                          ]),
                    ]))
            .toList()
      ]
    ]);
  }

  snap() async {
    RenderRepaintBoundary boundry = gKey.currentContext.findRenderObject();
    debugPrint(
        'start----${DateTime.now().second}.${DateTime.now().millisecond}');
    var fullImg = await boundry.toImage();
    var byteData = await fullImg.toByteData(format: ImageByteFormat.rawRgba);
    var rgbData = byteData.buffer.asUint8List();
    var partData = List.generate(
        30, (i) => List.filled(rgbData.length, 0, growable: true));
    for (int i = 0; i < rgbData.length; i += 4) {
      var randomIndex = Random().nextInt(10);
      partData[randomIndex].replaceRange(i, i + 4, rgbData.sublist(i, i + 4));
    }
    partData.forEach((item) {
      imgs.add(image.encodePng(
          image.Image.fromBytes(fullImg.width, fullImg.height, item)));
    });
    setState(() {});
  }
}
