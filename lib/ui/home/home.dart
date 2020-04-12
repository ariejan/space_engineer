import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/i18n/i18n.dart';
import 'package:space_engineer/redux/game/cooldown.dart';
import '../../redux/app/app_state.dart';
import 'home_viewmodel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
                    child: FaIcon(FontAwesomeIcons.sun, size: 28.0),
                    padding: const EdgeInsets.only(right: 8.0),
                  ),
                  Text(
                    I18n.of(context).pluralize("home.btn_mine", numberOfAsteroids),
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
        title: Center(
          child: Text(I18n.of(context).t('app.title')),
        ),
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
          _statusBar(resources: viewModel.resources, level: viewModel.level),
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

  Widget _statusBar({
    int resources,
    int level,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget> [
              Container(
                child: FaIcon(FontAwesomeIcons.angleDoubleUp, size: 16.0),
                padding: const EdgeInsets.only(right: 8.0),
              ),
              Text(
                  "$level",
                  style: TextStyle(
                    fontSize: 18.0,
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
                child: FaIcon(FontAwesomeIcons.biohazard, size: 16.0),
                padding: const EdgeInsets.only(right: 8.0),
              ),
              Text(
                  "$resources",
                  style: TextStyle(
                    fontSize: 18.0,
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}