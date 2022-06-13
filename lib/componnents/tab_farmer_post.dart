import 'package:farm_mobile/componnents/one_character.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class TabFarmerPost extends StatelessWidget {
  const TabFarmerPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/farmer_profile');
                            },
                            child: Row(
                              children: <Widget>[
                                OneCharacter(
                                  character: 'A',
                                ),
                                const Text('ALi Toonsi')
                              ],
                            ),
                          ),
                          Text(
                            '200dt',
                            style: regular14pt.copyWith(
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Text(
                        'Expreienced tranporter need to deliver 500L with top safety conditions.',
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
                            height: _responsive.getHeight(0.1),
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
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/call_transporter_form');
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Text(
                                'Edit',
                                style: regular16pt.copyWith(color: white),
                              ),
                            ),
                          )
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
