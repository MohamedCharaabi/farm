import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class MyFarmScreen extends StatelessWidget {
  const MyFarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: <Widget>[
              kSizedBox10,
              //  grid

              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 1.0,
                        // crossAxisSpacing: 10,
                        // mainAxisSpacing: 10,
                      ),
                      itemCount: myFarmMenu.length,
                      itemBuilder: (_, index) {
                        CustomMenuItem _menuItem = myFarmMenu[index];
                        return InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, _menuItem.route,
                              arguments: {'arg': _menuItem.arguments}),
                          child: Container(
                            height: 200,
                            width: 200,
                            margin: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: _menuItem.color,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5.0,
                                    spreadRadius: 5.0,
                                    offset: Offset(0.0, 1.0),
                                  ),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '18',
                                        style: headingStandart,
                                      ),
                                      Text(
                                        _menuItem.label,
                                        style: headingStandart,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(25.0),
                                      bottomRight: Radius.circular(9.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      _menuItem.image,
                                      color: _menuItem.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
