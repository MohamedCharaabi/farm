import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/custom_select.dart';
import 'package:farm_mobile/componnents/input_form.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FoodProcessForm extends StatefulWidget {
  const FoodProcessForm({Key? key}) : super(key: key);

  @override
  _FoodProcessFormState createState() => _FoodProcessFormState();
}

class _FoodProcessFormState extends State<FoodProcessForm> {
  final TextEditingController _startFoodController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _additionPerDayController =
      TextEditingController();

  String _selectedCow = 'Bella';
  final List<Map<String, String>> _cows = [
    {'label': 'Bella', 'value': 'Bella'},
    {'label': 'Nancy', 'value': 'Nancy'}
  ];

  String _selectedFood = 'gamh';
  final List<Map<String, String>> _food = [
    {'label': 'Chiir', 'value': 'chiir'},
    {'label': 'Gamh', 'value': 'gamh'}
  ];

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
        Row(
          children: <Widget>[
            // start food kg
            Expanded(
                child: InputForm(
                    label: 'Start(KG)', controller: _startFoodController)),
            const SizedBox(width: 15.0),
            Expanded(
              child: InputForm(
                  label: 'Addition/day(KG)',
                  controller: _additionPerDayController),
            ),
          ],
        ),
        kSizedBox10,
        CustomSelect(
          items: _food,
          value: _selectedFood,
          onChanged: (String? newValue) => setState(() {
            _selectedFood = newValue!;
          }),
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
