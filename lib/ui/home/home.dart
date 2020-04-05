import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../redux/app/app_state.dart';
import 'home_viewmodel.dart';

class Home extends StatefulWidget {
  final String _title = "Space Engineer";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget _buildIncrementButton({
    int numberOfAsteroids,
    bool miningOnCooldown,
    double miningCooldownFraction,
    Function() mineAsteroids,
  }) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          onPressed: miningOnCooldown ? null : mineAsteroids,
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 36.0),
          child: miningOnCooldown
              ?
                CircularProgressIndicator(
                  value: miningCooldownFraction,
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: FaIcon(FontAwesomeIcons.sun, size: 28.0),
                    padding: const EdgeInsets.only(right: 8.0),
                  ),
                  Text(
                    numberOfAsteroids == 1 ? "Mine 1 astroid" : "Mine $numberOfAsteroids astroids",
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
      body: LayoutBuilder(builder: (context, constraints) =>
        Container(
          color: Colors.black,
          child: StoreConnector<AppState, HomeViewModel>(
            builder: (_, viewModel) => content(viewModel, constraints),
            converter: (store) => HomeViewModel.fromStore(store)
          ),
        ),
      ),
    );
  }

  Widget content(HomeViewModel viewModel, BoxConstraints constraints) {
    return Container(
      child: Column(
        children: <Widget>[
          _statusBar(resources: viewModel.resources),
          Expanded(
            flex: 10,
            child: Text("TODO"),
          ),
          _buildIncrementButton(
            numberOfAsteroids: viewModel.numberOfAsteroids,
            miningOnCooldown: viewModel.miningOnCooldown,
            miningCooldownFraction: viewModel.miningCooldownFraction,
            mineAsteroids: viewModel.mineAsteroids,
          ),
        ],
      ),
    );
  }

  Widget _statusBar({
    int resources,
  }) {
    return Container(
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
    );
  }
}