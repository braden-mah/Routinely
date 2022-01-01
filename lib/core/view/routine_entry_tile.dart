import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/core/util/date_time_util.dart';

class RoutineEntryTile extends StatelessWidget {
  final int numerator;
  final int denominator;
  final DateTime date;
  const RoutineEntryTile(
      {Key? key,
      required this.numerator,
      required this.denominator,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: <Widget>[
          Expanded(
            flex: 3,
            child: Text('$numerator/$denominator',
                style: const TextStyle(fontSize: 20)),
          ),
          Expanded(
            flex: 2,
            child: Text(DateTimeUtil.toStringDate(date),
                textAlign: TextAlign.end,
                style: const TextStyle(color: Colors.grey)),
          )
        ]),
      ),
    );
  }
}
