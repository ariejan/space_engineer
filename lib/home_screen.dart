import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  final String _title = "Space Engineer";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _resources = 0;
  int _astroids = 1;

  void _mineAstroids() {
    setState(() {
      _resources += _randomMiningYield(_astroids);
    });
  }

  int _randomMiningYield(int astroids) {
    return astroids * 10;
  }

  Widget _buildIncrementButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FlatButton(
        onPressed: _mineAstroids,
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 36.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FaIcon(FontAwesomeIcons.sun, size: 28.0),
              padding: const EdgeInsets.only(right: 8.0),
            ),
            Text(
              _astroids == 1 ? "Mine 1 astroid" : "Mine $_astroids astroids",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )
            ),
          ],
        ),
        color: Colors.amber,
        textColor: Colors.black,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: FaIcon(FontAwesomeIcons.atom, size: 16.0),
                  padding: const EdgeInsets.only(right: 8.0),
                ),
                Text(
                  "$_resources",
                  style: TextStyle(
                    fontSize: 18.0,
                  )
                )
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Text("TODO"),
          ),
          _buildIncrementButton(context),
        ],
      ),
    );
  }
}