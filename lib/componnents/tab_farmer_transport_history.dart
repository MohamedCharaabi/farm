import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class TabFarmerTransportHistory extends StatelessWidget {
  const TabFarmerTransportHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, snapshot) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: _responsive.getHeight(0.9),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      buyerRow(icon: Icons.shop, userName: 'Ali Toonsi'),
                      buyerRow(
                          icon: Icons.shopping_cart, userName: 'Mohamed Saleh'),
                      kSizedBox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: const [
                              Icon(Icons.place),
                              Text('El Fahs, Zaghouan'),
                            ],
                          ),
                          Text(
                            '500L',
                            style: heading5,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: _responsive.getHeight(0.05),
                            width: 2.0,
                            color: Colors.black,
                          ),
                          const Text('20/01/2021::12:00')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: const [
                              Icon(Icons.place),
                              Text('Rades, Tunis'),
                            ],
                          ),
                          Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: mainColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: white,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class buyerRow extends StatelessWidget {
  buyerRow({
    Key? key,
    required this.icon,
    required this.userName,
  }) : super(key: key);

  IconData icon;
  String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 10.0,
        ),
        Text(
          userName,
          style: regular16pt,
        )
      ],
    );
  }
}
