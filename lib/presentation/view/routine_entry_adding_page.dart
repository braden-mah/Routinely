import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/routine_entry_editing_scroll_view.dart';
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
        body: RoutineEntryEditingScrollView(
          checkboxes: controller.routine.checkboxes,
          date: controller.date,
          onCheckboxChanged: controller.updateCheckbox,
          onDateChanged: (DateTime date) => controller.date = date,
          onNoteChanged: (val) => controller.note = val,
        ),
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
