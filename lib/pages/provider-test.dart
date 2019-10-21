import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdystep/store.dart';

class ProviderTest extends StatefulWidget {
  @override
  _ProviderTestState createState() => _ProviderTestState();
}

class _ProviderTestState extends State<ProviderTest> {
  var store;

  @override
  void initState() {
    super.initState();
    store = Provider.of<Store>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider-test'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Selector<Store, dynamic>(
                    selector: (_, store) => store.count1,
                    builder: (_, data, __) => Text(data.toString())),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  child: Text('count1++'),
                  onPressed: () {
                    store.count1 = ++store.count1;
                  },
                )
              ],
            ),
            Column(
              children: <Widget>[
                Selector<Store, dynamic>(
                    selector: (_, store) => store.count2,
                    builder: (_, data, __) => Text(data.toString())),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  child: Text('count2++'),
                  onPressed: () {
                    store.count2 = ++store.count2;
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
