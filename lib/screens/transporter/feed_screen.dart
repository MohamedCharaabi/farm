import 'package:farm_mobile/componnents/one_character.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class TransporterFeedScreen extends StatefulWidget {
  const TransporterFeedScreen({Key? key}) : super(key: key);

  @override
  State<TransporterFeedScreen> createState() => _TransporterFeedScreenState();
}

class _TransporterFeedScreenState extends State<TransporterFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Transport Feeds'),
          centerTitle: true,
          backgroundColor: mainColor,
          actions: const [
            Icon(Icons.search),
          ],
        ),
        body: SizedBox(
          height: _responsive.height,
          width: _responsive.width,
          child: Column(
            children: [
              kSizedBox10,
              kSizedBox10,
              Expanded(
                child: Padding(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/farmer_profile');
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: const [
                                        Icon(Icons.place),
                                        Text('Rades, Tunis'),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height:
                                                    _responsive.getHeight(0.3),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0,
                                                        vertical: 20.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    const Text(
                                                        'Are you sure you want to submit a request for this post?'),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        Text(
                                                          'No',
                                                          style:
                                                              heading5.copyWith(
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                        Text('Yes',
                                                            style: heading5
                                                                .copyWith(
                                                                    color: Colors
                                                                        .green)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 10.0),
                                        decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(25.0)),
                                        child: Text(
                                          'Subscrib',
                                          style: regular16pt.copyWith(
                                              color: white),
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
                    },
                  ),
                ),
              ),
              kSizedBox10,
            ],
          ),
        ),
      ),
    );
  }
}
