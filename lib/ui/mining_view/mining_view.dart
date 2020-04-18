import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/redux/game/cooldown.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'mining_view_model.dart';
import 'package:space_engineer/i18n/translations.dart';

class MiningView extends StatefulWidget {
  @override
  _MiningViewState createState() => _MiningViewState();
}

class _MiningViewState extends State<MiningView> {

  Widget _buildIncrementButton({
    int numberOfAsteroids,
    Cooldown miningCooldown,
    Function() mineAsteroids,
  }) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
          onPressed: miningCooldown != null ? null : mineAsteroids,
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
          child: miningCooldown != null
              ?
                CircularProgressIndicator(
                  value: miningCooldown.progress(),
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: FaIcon(FontAwesomeIcons.wrench, size: 28.0),
                    padding: const EdgeInsets.only(right: 8.0),
                  ),
                  Text(
                    Translations.of(context).btnMineAsteroids(numberOfAsteroids),
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
          _buildIncrementButton(
            numberOfAsteroids: viewModel.numberOfAsteroids,
            miningCooldown: viewModel.miningCooldown,
            mineAsteroids: viewModel.mineAsteroids,
          ),
        ],
      ),
    );
  }
}