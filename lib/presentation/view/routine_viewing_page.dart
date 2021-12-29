import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          child: Column(
            children: <Widget>[
              Text(controller.routine.description,
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => controller.goToAddEntryPage(context),
            child: const Icon(Icons.add)));
  }
}
