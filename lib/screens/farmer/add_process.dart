import 'package:farm_mobile/componnents/food_process_form.dart';
import 'package:farm_mobile/componnents/grass_process_form.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class AddProcess extends StatefulWidget {
  const AddProcess({Key? key}) : super(key: key);

  @override
  State<AddProcess> createState() => _AddProcessState();
}

class _AddProcessState extends State<AddProcess> {
  String _selectedProcess = 'grass_week';
  final List<Map<String, String>> _processType = [
    {'label': 'Grass Week', 'value': 'grass_week'},
    {'label': 'Food process', 'value': 'food_process'}
  ];

  int _selected = 0;

  final List<Widget> _tabs = const [GrassProcessForm(), FoodProcessForm()];

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Add Process'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                kSizedBox10,
                Container(
                  height: _responsive.getHeight(0.09),
                  width: _responsive.getWidth(0.75),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border.all(color: mainColor),
                      borderRadius: BorderRadius.circular(
                          _responsive.getHeight(0.09) * 0.5)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selected = 0;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: _selected == 0
                                      ? mainColor
                                      : backgroundColor,
                                  borderRadius: BorderRadius.circular(
                                      _responsive.getHeight(0.09) * 0.5),
                                ),
                                child: Center(
                                    child: Text(
                                  'Grass Week',
                                  style: TextStyle(
                                      color: _selected == 0 ? white : mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selected = 1;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: _selected == 1
                                      ? mainColor
                                      : backgroundColor,
                                  borderRadius: BorderRadius.circular(
                                      _responsive.getHeight(0.09) * 0.5),
                                ),
                                child: Center(
                                    child: Text('Food ',
                                        style: TextStyle(
                                            color: _selected == 1
                                                ? white
                                                : mainColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                kSizedBox10,
                // InputForm(label: 'label', controller: controller)
                _tabs[_selected],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
