import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/routine_editing_scroll_view.dart';
import 'package:routinely/presentation/controllers/routine_update_controller.dart';

class RoutineUpdatePage extends StatelessWidget {
  static const String route = '/updateRoutine';
  const RoutineUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final controller = Provider.of<RoutineUpdateController>(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Routine')),
        body: RoutineEditingScrollView(
          name: controller.name,
          description: controller.description,
          checkboxes: controller.checkboxes,
          onNameChanged: (val) => controller.name = val,
          onDescriptionChanged: (val) => controller.description = val,
          onCheckboxAdded: controller.addCheckbox,
          onCheckboxNameChanged: (val, index) =>
              controller.checkboxes[index] = val,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.handleUpdate(context);
              }
            },
            child: const Icon(Icons.check)),
      ),
    );
  }
}
