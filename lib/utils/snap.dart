import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as image;

class Snap extends StatefulWidget {
  final Widget child;
  Snap({this.child});
  @override
  _SnapState createState() => _SnapState();
}

class _SnapState extends State<Snap> {
  var size, images, imgs = [], gKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), getImgFromWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: imgs.length == 0
          ? [
              RepaintBoundary(
                key: gKey,
                child: widget.child,
              )
            ]
          : imgs
              .map<Widget>((item) => Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.memory(item),
                  ))
              .toList(),
    );
  }

  getImgFromWidget() async {
    RenderRepaintBoundary boundry = gKey.currentContext.findRenderObject();
    debugPrint('start----${DateTime.now().second}.${DateTime.now().millisecond}');
    size = boundry.size;
    var img = await boundry.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.rawRgba);
    var pngBytes = byteData.buffer.asUint8List();
    var copy = List.filled(pngBytes.length, 0, growable: true);
    var copy1 = List.filled(pngBytes.length, 0, growable: true);
    var copy2 = List.filled(pngBytes.length, 0, growable: true);
    copy.replaceRange(0, 10000, pngBytes.sublist(0, 10000));
    copy1.replaceRange(10000, 20000, pngBytes.sublist(10000, 20000));
    copy2.replaceRange(20000, 40000, pngBytes.sublist(20000, 40000));
    // debugPrint('pngBytes:$pngBytes');
    debugPrint('pngBytes length:${pngBytes.lengthInBytes}');
    // var length = pngBytes.lengthInBytes;
    // debugPrint(
    //     'length:$length---${byteData.buffer.asUint8ClampedList().length}');
    imgs = [
      image.encodePng(image.Image.fromBytes(img.width, img.height, copy)),
      image.encodePng(image.Image.fromBytes(img.width, img.height, copy1)),
      image.encodePng(image.Image.fromBytes(img.width, img.height, copy2)),
    ];
    setState(() {});
    debugPrint('end----${DateTime.now().second}.${DateTime.now().millisecond}');
    // debugPrint('pngBytes:$pngBytes');
    // debugPrint('image.decodeImage(pngBytes):${image.decodeImage(pngBytes)}');
    // return image.decodeImage(pngBytes);
  }
}
