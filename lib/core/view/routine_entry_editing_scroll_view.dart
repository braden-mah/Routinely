import 'package:flutter/cupertino.dart';
import 'package:routinely/core/view/custom_checkbox_field.dart';
import 'package:routinely/core/view/custom_text_field.dart';
import 'package:routinely/core/view/date_picker_field.dart';

class RoutineEntryEditingScrollView extends StatelessWidget {
  final List<String> checkboxes;
  final DateTime? date;
  final Function(bool, String) onCheckboxChanged;
  final Function(DateTime) onDateChanged;
  final Function(String) onNoteChanged;
  const RoutineEntryEditingScrollView(
      {Key? key,
      required this.checkboxes,
      required this.onCheckboxChanged,
      required this.date,
      required this.onDateChanged,
      required this.onNoteChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: checkboxes.length,
              itemBuilder: (context, index) {
                final name = checkboxes[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: CustomCheckboxField(
                    title: name,
                    onChanged: onCheckboxChanged,
                  ),
                );
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: DatePickerField(
              onDateChanged: onDateChanged,
              displayDate: date ?? DateTime.now(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: CustomTextField(
                validator: (val) {
                  if (val != null && val.length > 1000) {
                    return "Max length of 1000 characters";
                  }
                  return null;
                },
                onChanged: onNoteChanged,
                labelText: 'Optional Note',
                lines: 3),
          ),
        ],
      ),
    );
  }
}
