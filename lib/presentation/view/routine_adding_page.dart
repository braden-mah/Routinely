import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextFormField(
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
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Routine Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextFormField(
              onChanged: (val) => controller.description = val,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field can't be empty";
                }
                if (val.length > 1000) {
                  return "Max length of 1000 characters";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Routine Description'),
            ),
          ),
        ]),
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
