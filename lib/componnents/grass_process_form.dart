import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/input_form.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class GrassProcessForm extends StatefulWidget {
  const GrassProcessForm({Key? key}) : super(key: key);

  @override
  _GrassProcessFormState createState() => _GrassProcessFormState();
}

class _GrassProcessFormState extends State<GrassProcessForm> {
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCow = 'Bella';
  final List<Map<String, String>> _cows = [
    {'label': 'Bella', 'value': 'Bella'},
    {'label': 'Nancy', 'value': 'Nancy'}
  ];

  String? _selectedDate = null;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        kSizedBox10,
        InputDecorator(
          decoration: InputDecoration(
              labelText: 'Cow',
              labelStyle: const TextStyle(fontSize: 16),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedCow,
              onChanged: (String? newValue) => setState(
                () {
                  _selectedCow = newValue!;
                },
              ),
              items: _cows.map((Map cow) {
                return DropdownMenuItem<String>(
                  value: cow['value'],
                  child: Text(cow['label']),
                );
              }).toList(),
            ),
          ),
        ),
        kSizedBox10,
//        Start Date
        Row(
          children: [
            OutlinedButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2021, 9, 9),
                    maxTime: DateTime(2023, 6, 7), onConfirm: (date) {
                  setState(() {
                    _selectedDate = DateFormat.yMMMd().format(date);
                  });
                }, currentTime: DateTime.now());
              },
              child: const Text('Start Date'),
            ),
            Text(
              _selectedDate == null ? '' : _selectedDate!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        kSizedBox10,

        //  Description
        InputForm(
            label: 'Description',
            maxLines: 3,
            controller: _descriptionController),

        kSizedBox10,
        //  Submit
        CustomPrimaryButton(
            buttonColor: mainColor,
            textValue: 'ADD',
            textColor: white,
            onClick: () {})
      ],
    ));
  }
}
