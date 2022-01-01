import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/routine_editing_scroll_view.dart';
import 'package:routinely/presentation/controllers/routine_adding_controller.dart';

class RoutineAddingPage extends StatelessWidget {
  static const String route = '/addRoutine';
  const RoutineAddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddRoutineController>(context);
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Routine')),
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
                controller.handleSubmit(context);
              }
            },
            child: const Icon(Icons.check)),
      ),
    );
  }
}
