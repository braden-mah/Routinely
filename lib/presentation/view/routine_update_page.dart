import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/custom_text_field.dart';
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
        body: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: CustomTextField(
              initialValue: controller.name,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field can't be empty";
                }
                if (val.length > 40) {
                  return "Max length of 40 characters";
                }
                return null;
              },
              onChanged: (val) => controller.name = val,
              labelText: 'Routine Name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: CustomTextField(
              lines: 10,
              initialValue: controller.description,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field can't be empty";
                }
                if (val.length > 1000) {
                  return "Max length of 1000 characters";
                }
                return null;
              },
              onChanged: (val) => controller.description = val,
              labelText: 'Routine Description',
            ),
          ),
        ]),
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
