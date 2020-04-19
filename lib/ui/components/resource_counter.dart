import 'package:flutter/material.dart';

class ResourceCounter extends StatefulWidget {

  final IconData icon;
  final int value;

  const ResourceCounter({
    Key key,
    @required this.icon,
    @required this.value
  }) : super(key: key);

  @override
  _ResourceCounterState createState() => _ResourceCounterState();
}

class _ResourceCounterState extends State<ResourceCounter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 3.0, bottom: 2.0),
            child: Icon(
              widget.icon,
              size: 14.0,
              color: Colors.amber,
            ),
          ),
          Text(
            widget.value.toString(),
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}

//Row( // Fuel
//children: <Widget>[
//Container(
//child: FaIcon(FontAwesomeIcons.biohazard, size: 16.0, color: widget._foregroundColor),
//padding: EdgeInsets.only(right: widget._iconValuePadding),
//),
//Text(
//viewModel.fuel.toString(),
//style: TextStyle(
//fontSize: 18.0,
//color: widget._foregroundColor,
//)
//)
//],
//),