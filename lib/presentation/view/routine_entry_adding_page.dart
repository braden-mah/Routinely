import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/custom_text_field.dart';
import 'package:routinely/core/view/date_picker_field.dart';
import 'package:routinely/presentation/controllers/routine_entry_adding_controller.dart';

class RoutineEntryAddingPage extends StatelessWidget {
  static String route = '/addRoutineEntry';
  const RoutineEntryAddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoutineEntryAddingController>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Routine Entry')),
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: DatePickerField(
              onDateChanged: (DateTime date) => controller.date = date,
              displayDate: controller.date ?? DateTime.now(),
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
                onChanged: (val) => controller.note = val,
                labelText: 'Optional Note',
                lines: 3),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await controller.addRoutineEntry(context);
                Navigator.pop(context);
              }
            },
            child: const Icon(Icons.check)),
      ),
    );
  }
}
