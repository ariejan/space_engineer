import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'mining_view_model.dart';

class MiningView extends StatefulWidget {
  @override
  _MiningViewState createState() => _MiningViewState();
}

class _MiningViewState extends State<MiningView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, MiningViewModel>(
        builder: (_, viewModel) => content(viewModel),
        converter: (store) => MiningViewModel.fromStore(store)
      ),
    );
  }

  Widget content(MiningViewModel viewModel) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Text("TODO"),
          ),
        ],
      ),
    );
  }
}