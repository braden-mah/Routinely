import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/presentation/controllers/routine_viewing_controller.dart';

class RoutineViewingPage extends StatelessWidget {
  static const String route = '/';
  const RoutineViewingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ViewRoutineController>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Routinely')),
        body: ListView.builder(
          itemCount: controller.routines.length,
          itemBuilder: (BuildContext context, int index) {
            final item = controller.routines[index];
            return Card(
                child: ListTile(
                    title: Text(item.title), subtitle: Text(item.description)));
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => controller.goToAddRoutinePage(context),
            child: const Icon(Icons.add)));
  }
}
