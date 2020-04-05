import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/actions/actions.dart';

import 'models/app_state.dart';

class HomeScreen extends StatefulWidget {
  final String _title = "Space Engineer";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildIncrementButton(BuildContext context) {
    return StoreConnector<AppState, int> (
      converter: (Store<AppState> store) => store.state.asteroids,
      builder: (BuildContext context, int asteroids) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: () => StoreProvider.of<AppState>(context).dispatch(MineAsteroidsAction(asteroids)),
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 36.0),
              child: StoreConnector<AppState, int>(
                converter: (Store<AppState> store) => store.state.asteroids,
                builder: (BuildContext context, int asteroids) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FaIcon(FontAwesomeIcons.sun, size: 28.0),
                        padding: const EdgeInsets.only(right: 8.0),
                      ),
                      Text(
                          asteroids == 1 ? "Mine 1 astroid" : "Mine $asteroids astroids",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          )
                      ),
                    ],
                  );
                },
              ),
              color: Colors.amber,
              textColor: Colors.black,
            )
          );
      }
    );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: StoreConnector<AppState, int>(
        converter: (Store<AppState> store) => store.state.resources,
        builder: (BuildContext context, int resources) {
          return Column(
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
                        "$resources",
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
          );
        },
      ),
    );
  }
}