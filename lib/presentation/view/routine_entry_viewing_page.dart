import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/util/date_time_util.dart';
import 'package:routinely/core/view/custom_checkbox_field.dart';
import 'package:routinely/presentation/controllers/routine_entry_viewing_controller.dart';

class RoutineEntryViewingPage extends StatelessWidget {
  static String route = '/viewRoutineEntry';
  const RoutineEntryViewingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoutineEntryViewingController>(context);
    return Scaffold(
      appBar:
          AppBar(title: Text('Entry: ${controller.routine.title}'), actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => controller.goToEntryUpdatePage(context),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => controller.handleDelete(context),
        )
      ]),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.routine.checkboxes.length,
                  itemBuilder: (context, index) {
                    final String checkbox =
                        controller.routine.checkboxes[index];
                    return CustomCheckboxField(
                      title: checkbox,
                      isChecked:
                          controller.routineEntry.checkboxes.contains(checkbox),
                      enabled: false,
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: controller.routineEntry.note.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(controller.routineEntry.note),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Entry Date: ${DateTimeUtil.toStringDate(controller.routineEntry.date)}'),
            ),
          ],
        ),
      ),
    );
  }
}
