import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/view/custom_text_field.dart';
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
        body: SingleChildScrollView(
          reverse: true,
          physics: const ScrollPhysics(),
          child: Column(
            children: <Widget>[
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
                  initialValue: controller.description,
                  lines: 10,
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.checkboxes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: CustomTextField(
                      initialValue: controller.checkboxes[index],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Field can't be empty";
                        }
                        if (val.length > 500) {
                          return "Max length of 500 characters";
                        }
                        return null;
                      },
                      onChanged: (val) => controller.checkboxes[index] = val,
                      labelText: 'Checkbox Item ${index + 1}',
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Center(
                  child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Add Checkbox Item"),
                    ),
                    onPressed: controller.addCheckbox,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
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
