import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckboxField extends StatefulWidget {
  final bool isChecked;
  final String title;
  final bool enabled;
  final Function? onChanged;
  const CustomCheckboxField(
      {Key? key,
      required this.title,
      this.onChanged,
      this.isChecked = false,
      this.enabled = true})
      : super(key: key);

  @override
  _CustomCheckboxFieldState createState() => _CustomCheckboxFieldState();
}

class _CustomCheckboxFieldState extends State<CustomCheckboxField> {
  late bool isChecked;
  @override
  void initState() {
    isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) {
        if (widget.enabled) {
          setState(() => isChecked = value!);
          widget.onChanged!(isChecked, widget.title);
        }
      },
      title: Text(widget.title),
    );
  }
}
