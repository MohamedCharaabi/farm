import 'package:flutter/material.dart';

class CustomSelect extends StatelessWidget {
  CustomSelect(
      {Key? key,
      required this.items,
      required this.value,
      required this.onChanged})
      : super(key: key);

  String value;
  List<Map<String, String>> items;

  Function onChanged;
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          labelText: 'Cow',
          labelStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          onChanged: (String? newValue) {
            onChanged(newValue);
          },
          items: items.map((Map cow) {
            return DropdownMenuItem<String>(
              value: cow['value'],
              child: Text(cow['label']),
            );
          }).toList(),
        ),
      ),
    );
  }
}
