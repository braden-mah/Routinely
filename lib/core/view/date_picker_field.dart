import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/core/util/date_time_util.dart';

class DatePickerField extends StatefulWidget {
  final Function onDateChanged;
  final DateTime displayDate;
  const DatePickerField(
      {required this.onDateChanged, required this.displayDate, Key? key})
      : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController.text = DateTimeUtil.toStringDate(widget.displayDate);
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? date = await showDate(context);
        if (date != null) {
          widget.onDateChanged(date);
          setState(() => textController.text = DateTimeUtil.toStringDate(date));
        }
      },
      child: TextField(
        controller: textController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
          labelText: 'Entry Date',
        ),
        enabled: false,
      ),
    );
  }

  Future<DateTime?> showDate(BuildContext context) async =>
      await showDatePicker(
          context: context,
          initialDate: widget.displayDate,
          firstDate: DateTime.parse('2000-01-01'),
          lastDate: DateTime.parse('2099-12-31'));
}
