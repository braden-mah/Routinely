import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/presentation/controllers/routine_viewing_listing_controller.dart';

class RoutineViewingListingPage extends StatelessWidget {
  static const String route = '/';
  const RoutineViewingListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RoutineViewingListingController>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Routinely')),
        body: ListView.builder(
          itemCount: controller.routines.length,
          itemBuilder: (BuildContext context, int index) {
            final item = controller.routines[index];
            return GestureDetector(
              onTap: () => controller.goToRoutineViewingPage(context, item),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(title: Text(item.title)),
              )),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => controller.goToAddRoutinePage(context),
            child: const Icon(Icons.add)));
  }
}
