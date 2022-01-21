import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/routine_entry_tile.dart';
import 'package:routinely/presentation/controllers/routine_viewing_controller.dart';

class RoutineViewingPage extends StatelessWidget {
  static const String route = '/viewRoutine';
  const RoutineViewingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoutineViewingController>(context);
    return Scaffold(
        appBar: AppBar(title: Text(controller.routine.title), actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () => controller.handleDelete(context),
                icon: const Icon(Icons.delete)),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () => {controller.goToUpdatePage(context)},
                icon: const Icon(Icons.edit),
              ))
        ]),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(controller.routine.description,
                    style: const TextStyle(fontSize: 16)),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.routine.checkboxes.length,
                      itemBuilder: (context, index) {
                        return Text(
                            '- ${controller.routine.checkboxes[index]}');
                      }),
                ),
                Visibility(
                  visible: controller.routineEntries.isNotEmpty,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.routineEntries.length,
                          itemBuilder: (context, index) {
                            final routineEntry =
                                controller.routineEntries[index];
                            return GestureDetector(
                              onTap: () => controller.goToEntryViewingPage(
                                  context, routineEntry),
                              child: RoutineEntryTile(
                                  numerator: routineEntry.checkboxes.length,
                                  denominator:
                                      controller.routine.checkboxes.length,
                                  date: routineEntry.date),
                            );
                          })),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => controller.goToAddEntryPage(context),
            child: const Icon(Icons.add)));
  }
}
