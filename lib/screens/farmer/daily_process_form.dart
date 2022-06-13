// ignore_for_file: unused_local_variable

import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/input_form.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/domain/models/cow_model.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

class DailyProcessForm extends StatefulWidget {
  const DailyProcessForm({Key? key}) : super(key: key);

  @override
  State<DailyProcessForm> createState() => _DailyProcessFormState();
}

class _DailyProcessFormState extends State<DailyProcessForm> {
  final TextEditingController _cowController = TextEditingController();

  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _milkController = TextEditingController();

  String _selectedCow = 'Bella';

  static String _displayStringForOption(Cow option) => option.id;

  String _selectedFood = 'gamh';
  final List<Map<String, String>> _food = [
    {'label': 'Chiir', 'value': 'chiir'},
    {'label': 'Gamh', 'value': 'gamh'}
  ];

  Future getCows() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      return cowsData;
    });
  }

  String? _selectedDate = DateFormat.yMd().add_jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Daily Process'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                kSizedBox10,
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2021, 9, 9),
                            maxTime: DateTime(2023, 6, 7), onConfirm: (date) {
                          setState(() {
                            _selectedDate =
                                DateFormat.yMd().add_jm().format(date);
                          });
                        }, currentTime: DateTime.now());
                      },
                      child: const Text('Pick a Date'),
                    ),
                    Text(
                      _selectedDate == null ? '' : _selectedDate!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                kSizedBox10,
                InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Cow ID',
                    labelStyle: const TextStyle(fontSize: 16),
                  ),
                  child: Autocomplete<Cow>(
                    displayStringForOption: _displayStringForOption,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Cow>.empty();
                      }
                      if (textEditingValue.text == '') {
                        return const Iterable<Cow>.empty();
                      }

                      return cowsData.where((Cow option) {
                        return option
                            .toString()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (selection) {
                      print(
                          'You just selected ${_displayStringForOption(selection)}');
                    },
                  ),
                ),
                kSizedBox20,
                InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Food',
                      labelStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedFood,
                      onChanged: (String? newValue) => setState(
                        () {
                          _selectedFood = newValue!;
                        },
                      ),
                      items: _food.map((Map cow) {
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
                            label: 'Food(KG)', controller: _foodController)),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: InputForm(
                          label: 'Milk(L)', controller: _milkController),
                    ),
                  ],
                ),
                kSizedBox10,
                CustomPrimaryButton(
                    buttonColor: mainColor,
                    textValue: 'Submit',
                    textColor: white,
                    onClick: () {}),
                kSizedBox10,
              ],
            ),
          )),
    );
  }
}
