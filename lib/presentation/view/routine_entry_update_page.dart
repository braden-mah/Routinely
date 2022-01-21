import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/routine_entry_editing_scroll_view.dart';
import 'package:routinely/presentation/controllers/routine_entry_update_controller.dart';

class RoutineEntryUpdatePage extends StatelessWidget {
  static const String route = '/updateRoutineEntry';
  const RoutineEntryUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoutineEntryUpdateController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Routine Entry'),
      ),
      body: RoutineEntryEditingScrollView(
        date: controller.date,
        onCheckboxChanged: controller.updateCheckbox,
        onDateChanged: (date) => controller.date = date,
        checkboxes: controller.routine.checkboxes,
        onNoteChanged: (val) => controller.note = val,
        filledCheckboxes: controller.checkboxes,
        note: controller.note,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => controller.updateRoutineEntry(context),
          child: const Icon(Icons.check)),
    );
  }
}
