import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/componnents/custom_select.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'input_form.dart';

class SellFormModal extends StatefulWidget {
  const SellFormModal({Key? key}) : super(key: key);

  @override
  _SellFormModalState createState() => _SellFormModalState();
}

class _SellFormModalState extends State<SellFormModal> {
  final TextEditingController _postTitleController = TextEditingController();
  final TextEditingController _postDescriptionController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  String _selectedProductType = 'milk';
  final List<Map<String, String>> _productTypes = [
    {'label': 'Milk', 'value': 'milk'},
    {'label': 'Cow', 'value': 'cow'}
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.25,
        maxChildSize: 0.7,
        builder: (context, controller) {
          return Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            height: Responsive(context).getHeight(0.7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    kSizedBox10,
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close))),
                    kSizedBox20,
                    CustomSelect(
                        items: _productTypes,
                        value: _selectedProductType,
                        onChanged: (String val) =>
                            setState(() => _selectedProductType = val)),
                    kSizedBox10,
                    InputForm(
                        label: 'Quantity', controller: _quantityController),
                    kSizedBox10,
                    InputForm(
                        label: 'Post Title', controller: _postTitleController),
                    kSizedBox10,
                    InputForm(
                        label: 'Post Description',
                        maxLines: 3,
                        controller: _postDescriptionController),
                    kSizedBox20,
                    CustomPrimaryButton(
                        buttonColor: mainColor,
                        textValue: 'Submit',
                        textColor: white,
                        onClick: () {}),
                    kSizedBox10
                  ],
                ),
              ),
            ),
          );
        });
  }
}
