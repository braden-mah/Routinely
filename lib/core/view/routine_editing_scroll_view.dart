import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routinely/core/view/custom_text_field.dart';

class RoutineEditingScrollView extends StatelessWidget {
  final String name;
  final Function(String) onNameChanged;
  final Function(String) onDescriptionChanged;
  final String description;
  final List<String> checkboxes;
  final VoidCallback onCheckboxAdded;
  final Function(String, int) onCheckboxNameChanged;
  const RoutineEditingScrollView(
      {Key? key,
      required this.name,
      required this.onNameChanged,
      required this.description,
      required this.onDescriptionChanged,
      required this.checkboxes,
      required this.onCheckboxAdded,
      required this.onCheckboxNameChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: CustomTextField(
              initialValue: name,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Field can't be empty";
                }
                if (val.length > 40) {
                  return "Max length of 40 characters";
                }
                return null;
              },
              onChanged: onNameChanged,
              labelText: 'Routine Name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: CustomTextField(
              initialValue: description,
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
              onChanged: onDescriptionChanged,
              labelText: 'Routine Description',
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: checkboxes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: CustomTextField(
                  initialValue: checkboxes[index],
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Field can't be empty";
                    }
                    if (val.length > 500) {
                      return "Max length of 500 characters";
                    }
                    return null;
                  },
                  onChanged: (val) => onCheckboxNameChanged(val, index),
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
                onPressed: onCheckboxAdded,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
