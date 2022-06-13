import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  InputForm({
    Key? key,
    required this.label,
    this.inputType = TextInputType.text,
    required this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  String label;
  TextInputType inputType;
  TextEditingController controller;
  int maxLines;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      controller: widget.controller,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
