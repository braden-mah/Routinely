import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckboxField extends StatefulWidget {
  final String title;
  final Function onChanged;
  const CustomCheckboxField(
      {Key? key, required this.title, required this.onChanged})
      : super(key: key);

  @override
  _CustomCheckboxFieldState createState() => _CustomCheckboxFieldState();
}

class _CustomCheckboxFieldState extends State<CustomCheckboxField> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: isChecked,
        onChanged: (value) {
          setState(() => isChecked = value!);
          widget.onChanged(isChecked, widget.title);
        },
        title: Text(widget.title),
      ),
    );
  }
}
