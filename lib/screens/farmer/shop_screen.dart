import 'dart:ffi';

import 'package:farm_mobile/componnents/sell_form_modal.dart';
import 'package:farm_mobile/componnents/tab_buy.dart';
import 'package:farm_mobile/componnents/tab_sell.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _selected = 0;

  final List<Widget> _tabs = const [TabBuy(), TabSell()];

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Shop'),
        centerTitle: true,
        backgroundColor: mainColor,
        actions: const [],
      ),
      floatingActionButton: Visibility(
        visible: _selected == 1,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<Void>(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => const SellFormModal());
          },
          child: const Icon(Icons.add),
          backgroundColor: mainColor,
        ),
      ),
      body: SizedBox(
        height: _responsive.height,
        width: _responsive.width,
        child: Column(
          children: [
            kSizedBox10,
            SizedBox(
              height: _responsive.getHeight(0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: _responsive.getHeight(0.09),
                    width: _responsive.getWidth(0.75),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        border: Border.all(color: mainColor),
                        borderRadius: BorderRadius.circular(
                            _responsive.getHeight(0.9) * 0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
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
                                      _responsive.getHeight(0.9) * 0.5),
                                ),
                                child: Center(
                                    child: Text(
                                  'Buy',
                                  style: TextStyle(
                                      color: _selected == 0 ? white : mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
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
                                      _responsive.getHeight(0.9) * 0.5),
                                ),
                                child: Center(
                                    child: Text('Sell',
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
                  _selected == 0
                      ? InkWell(
                          onTap: () {}, child: const Icon(Icons.filter_list))
                      : const SizedBox(),
                ],
              ),
            ),
            kSizedBox10,
            Expanded(
              child: _tabs[_selected],
            ),
            kSizedBox10,
          ],
        ),
      ),
    );
  }
}
