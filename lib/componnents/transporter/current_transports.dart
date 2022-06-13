import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class CurrentTransports extends StatelessWidget {
  const CurrentTransports({Key? key}) : super(key: key);

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
            // height: _responsive.getHeight(0.2),
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
                          children: [
                            const Icon(Icons.local_shipping),
                            Text(
                              'Car 002',
                              style: regular16pt.copyWith(
                                  fontWeight: FontWeight.bold),
                            )
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
                    SizedBox(
                      width: _responsive.getWidth(0.8),
                      child: const Text(
                        'bla bla bla bla bla bla bla blabla bla bla blabla bla bla blabla bla bla blabla bla bla bla ',
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
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
