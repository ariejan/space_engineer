import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/redux/app/app_state.dart';

class StatusBar extends StatefulWidget {

  final Color _backgroundColor = Colors.black54;
  final Color _foregroundColor = Colors.amber;

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget._backgroundColor,
      child: StoreConnector<AppState, StatusBarViewModel>(
          builder: (_, viewModel) => _statusBar(viewModel),
          converter: (store) => StatusBarViewModel.fromStore(store)
      ),
    );
  }

  Widget _statusBar(StatusBarViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget> [
              Container(
                child: FaIcon(FontAwesomeIcons.angleDoubleUp, size: 16.0, color: widget._foregroundColor),
                padding: const EdgeInsets.only(right: 8.0),
              ),
              Text(
                  viewModel.level.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: widget._foregroundColor,
                  )
              )
            ],
          ),
          Expanded(
            child: Text(""),
          ),
          Row(
            children: <Widget>[
              Container(
                child: FaIcon(FontAwesomeIcons.biohazard, size: 16.0, color: widget._foregroundColor),
                padding: const EdgeInsets.only(right: 8.0),
              ),
              Text(
                  viewModel.resources.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: widget._foregroundColor,
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

class StatusBarViewModel {

  final int resources;
  final int level;

  StatusBarViewModel({
    this.resources,
    this.level,
  });

  static StatusBarViewModel fromStore(Store<AppState> store) {
    return StatusBarViewModel(
      resources: store.state.gameState.resources,
      level: store.state.gameState.level,
    );
  }
}