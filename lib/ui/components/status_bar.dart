import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/ui/components/resource_counter.dart';

class StatusBar extends StatefulWidget {

  final Color _backgroundColor = Colors.black54;
  final Color _foregroundColor = Colors.amber;

  final double _iconValuePadding = 3.0;


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
          ResourceCounter(
            icon: FontAwesomeIcons.gasPump,
            value: viewModel.fuel,
          ),
          ResourceCounter(
            icon: FontAwesomeIcons.weightHanging,
            value: viewModel.metal,
          ),
          ResourceCounter(
            icon: FontAwesomeIcons.ring,
            value: viewModel.carbon,
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            children: <Widget> [
              Container(
                child: FaIcon(FontAwesomeIcons.checkDouble, size: 16.0, color: widget._foregroundColor),
                padding: const EdgeInsets.only(right: 8.0),
              ),
              Text(
                  viewModel.turn.toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: widget._foregroundColor,
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StatusBarViewModel {

  final int fuel;
  final int metal;
  final int carbon;
  final int level;
  final int turn;

  StatusBarViewModel({
    this.fuel,
    this.metal,
    this.carbon,
    this.level,
    this.turn,
  });

  static StatusBarViewModel fromStore(Store<AppState> store) {
    return StatusBarViewModel(
      fuel: store.state.gameState.fuel,
      metal: store.state.gameState.metal,
      carbon: store.state.gameState.carbon,
      level: store.state.gameState.level,
      turn: store.state.gameState.turn,
    );
  }
}