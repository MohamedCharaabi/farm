import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class FarmerProfileScreen extends StatelessWidget {
  const FarmerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: _responsive.height,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    width: double.infinity,
                    height: _responsive.getHeight(0.3),
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: white,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.edit_outlined,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                        kSizedBox10,
                        Text(
                          'ALi Toonsi (Farmer)',
                          style: heading5.copyWith(color: white),
                        ),
                        kSizedBox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.place,
                              color: white,
                            ),
                            Text(
                              'El Fahs, Zaghouan',
                              style: regular16pt.copyWith(color: white),
                            )
                          ],
                        ),
                        SizedBox(
                          width: _responsive.width,
                          height: 30,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  kSizedBox30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'I\'m Ali very special farmer with a lot of knowldge in farming specialized in taking care of cows.',
                      style: regular14pt,
                    ),
                  ),
                  kSizedBox10,
                  Expanded(
                    child: Container(
                      // height: _responsive.getHeight(0.2),
                      margin: const EdgeInsets.only(left: 15.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                                // height: _responsive.getHeight(0.3),
                                width: _responsive.getWidth(0.7),
                                margin: const EdgeInsets.only(
                                    right: 15.0, bottom: 15.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: mainColor)),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: _responsive.width,
                                      height: 20,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: Colors.amber[600],
                                              size: 18,
                                            );
                                          }),
                                    ),
                                    const Text(
                                        'It\'s always a pleasure working with Ali, nice work I surely recommend him.')
                                  ],
                                ));
                          }),
                    ),
                  )
                ],
              ),
            ),
            // avatar
            Positioned(
              top: _responsive.getHeight(0.3) - 70,
              left: 15,
              child: Center(
                child: Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
