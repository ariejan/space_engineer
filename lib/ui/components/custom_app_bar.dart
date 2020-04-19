import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:space_engineer/i18n/translations.dart';
import 'package:space_engineer/redux/app/app_state.dart';
import 'package:space_engineer/redux/game/game_actions.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Color _btnTextColor = Colors.black;
  final Color _snackBarBackgroundColor = Colors.black;
  final Color _snackBarTextColor = Colors.amber;

  CustomAppBar({
    Key key,
  })
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(Translations.of(context).appTitle),
      leading: GestureDetector(
        onTap: () {},
        child: Icon(Icons.menu),
      ),
      actions: <Widget>[
        StoreConnector<AppState, Function>(
          builder: (_, handleEndTurn) => content(context, handleEndTurn),
          converter: (store) => () => store.dispatch(EndTurnAction()),
        )
      ],
    );
  }

  Widget content(BuildContext context, Function handleEndTurn) {
    return Padding(
      padding: EdgeInsets.only(right: 0),
      child: GestureDetector(
          onTap: () {},
          child: FlatButton(
            onPressed: () {
              handleEndTurn();
              Scaffold.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 1500),
                content: Text(
                  "Handling turn of events",
                  style: TextStyle(
                    color: widget._snackBarTextColor,
                  ),
                ),
                backgroundColor: widget._snackBarBackgroundColor,
              ));
            },
            textColor: widget._btnTextColor,
            child: Row(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.checkDouble),
              ],
            ),
          )
      ),
    );
  }
}