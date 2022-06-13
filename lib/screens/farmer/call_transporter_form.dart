import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/input_form.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CallTransporterForm extends StatefulWidget {
  const CallTransporterForm({Key? key}) : super(key: key);

  @override
  State<CallTransporterForm> createState() => _CallTransporterFormState();
}

class _CallTransporterFormState extends State<CallTransporterForm> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedDate = DateFormat.yMd().add_jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: const Text('Call Transporter'),
      ),
      body: Padding(
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
              InputForm(label: 'Start', controller: _startController),
              kSizedBox10,
              InputForm(
                  label: 'Destination', controller: _destinationController),
              kSizedBox10,
              Row(
                children: <Widget>[
                  Expanded(
                      child: InputForm(
                    label: 'Quantity',
                    controller: _quantityController,
                  )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: InputForm(
                          label: 'Price', controller: _priceController)),
                ],
              ),
              kSizedBox10,
              InputForm(
                label: 'Description',
                controller: _descriptionController,
                maxLines: 3,
              ),
              kSizedBox20,
              CustomPrimaryButton(
                  buttonColor: mainColor,
                  textValue: 'Submit',
                  textColor: white,
                  onClick: () {}),
              kSizedBox10,
            ],
          ),
        ),
      ),
    );
  }
}
