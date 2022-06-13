import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/input_form.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final TextEditingController _numberCowController = TextEditingController();
  final TextEditingController _milkInTankController = TextEditingController();
  final TextEditingController _calvesMilkDayController =
      TextEditingController();
  final TextEditingController _milkSelledDayController =
      TextEditingController();
  final TextEditingController _milkThrownController = TextEditingController();
  final TextEditingController _productionDaysNumberInTankController =
      TextEditingController();
  final TextEditingController _concentrateTotalController =
      TextEditingController();
  final TextEditingController _waterDrinkedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate'),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              kSizedBox20,
              InputForm(
                label: 'Cow number',
                controller: _numberCowController,
                inputType: TextInputType.number,
              ),
              kSizedBox10,
              InputForm(
                  label: 'Milk in Tank/L',
                  controller: _milkInTankController,
                  inputType: TextInputType.number),
              kSizedBox10,
              InputForm(
                  label: 'calves Milk/Day',
                  controller: _calvesMilkDayController,
                  inputType: TextInputType.number),
              kSizedBox10,
              InputForm(
                  label: 'Milk selled L/Day',
                  controller: _milkSelledDayController,
                  inputType: TextInputType.number),
              kSizedBox10,
              InputForm(
                  label: 'Milk Thrown/Day',
                  controller: _milkThrownController,
                  inputType: TextInputType.number),
              kSizedBox10,
              InputForm(
                  label: 'Production days number in tank',
                  controller: _productionDaysNumberInTankController,
                  inputType: TextInputType.number),
              kSizedBox10,
              InputForm(
                  label: 'Concentrate Total(KG) /Day',
                  controller: _concentrateTotalController,
                  inputType: TextInputType.number),
              kSizedBox10,
              InputForm(
                  label: 'Water drinked',
                  controller: _waterDrinkedController,
                  inputType: TextInputType.number),
              kSizedBox10,
              CustomPrimaryButton(
                  buttonColor: mainColor,
                  textValue: 'Calculate',
                  textColor: white,
                  onClick: () {
                    Navigator.pushNamed(context, '/result');
                  }),
              kSizedBox20,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
