import 'package:flutter/material.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';

class HistoryTransports extends StatelessWidget {
  const HistoryTransports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: false,
        itemCount: 6,
        itemBuilder: (_, index) {
          return SizedBox(
            width: _responsive.width,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const [
                            Icon(Icons.local_shipping),
                            Text('Car 002')
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: Icon(
                                Icons.check,
                                color: white,
                              )),
                        ),
                      ],
                    ),
                    Text(
                      '300dt',
                      style: regular16pt.copyWith(fontWeight: FontWeight.bold),
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
                        const Text('20/01/2021::12:00')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
