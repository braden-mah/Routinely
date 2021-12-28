import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? Function(String?) validator;
  final void Function(String) onChanged;
  final String labelText;
  final String initialValue;
  final int lines;
  const CustomTextField(
      {Key? key,
      required this.validator,
      required this.onChanged,
      required this.labelText,
      this.initialValue = '',
      this.lines = 1})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    textController.text = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.lines,
      maxLines: widget.lines,
      controller: textController,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                setState(() => textController.text = '');
                widget.onChanged('');
              },
              child: const Icon(Icons.close)),
          border: const OutlineInputBorder(),
          labelText: widget.labelText),
    );
  }
}
