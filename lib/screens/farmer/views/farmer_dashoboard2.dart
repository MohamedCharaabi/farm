import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/screens/farmer/views/farmer_dashoboard.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

final tasks = Container(
  margin: const EdgeInsets.only(right: 15, top: 10),
  child: Column(
    children: const [
      TaskCard(),
      SizedBox(height: 20),
      TaskCard(),
    ],
  ),
);

class FarmerDashbord2 extends StatelessWidget {
  const FarmerDashbord2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dashboard", style: heading16.copyWith(fontSize: 25)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedBtn(
                      title: "All Fields",
                      onPressed: () {},
                      isSelected: true,
                    ),
                    const SizedBox(width: 15.0),
                    RoundedBtn(
                      title: "Weat",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15.0),
                    RoundedBtn(
                      title: "Maize",
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15.0),
                  ],
                ),
              )

              //  weather
              ,
              const SizedBox(height: 20),
              Text("Weather Forecast", style: heading16.copyWith(fontSize: 23)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/cloudy.png",
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      children: [
                        Text("Today",
                            style: heading16.copyWith(color: Colors.green)),
                        Text("15'C", style: heading16),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "11:46h",
                                style: heading16.copyWith(color: textBlack),
                                children: [
                              TextSpan(
                                text: "(7:19 / 7:49)",
                                style: heading16.copyWith(color: Colors.grey),
                              )
                            ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/humidity.png",
                                  height: 25,
                                  width: 25,
                                ),
                                Text("59%", style: heading16),
                              ],
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/wind.png",
                                  height: 25,
                                  width: 25,
                                ),
                                Text("6k/h", style: heading16),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text("Current Tasks", style: heading16.copyWith(fontSize: 23)),
              const SizedBox(height: 20),
              SizedBox(
                height: _responsive.getHeight(.5),
                width: _responsive.width,
                child: CarouselSlider(
                  items: [tasks, tasks, tasks],
                  options: CarouselOptions(
                    height: 400,
                    // aspectRatio: 1,
                    viewportFraction: .9,
                    initialPage: 0,
                    pageSnapping: true,
                    enableInfiniteScroll: false,
                    // enableInfiniteScroll: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    // enlargeCenterPage: true,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    this.dateContainerColor = Colors.red,
  }) : super(key: key);

  final Color dateContainerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: dateContainerColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "2d",
                      style: regular16pt.copyWith(color: white),
                    ),
                    Text(
                      "due",
                      style: regular16pt.copyWith(color: white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                      "Scheduled spraying was not performed you have 2 days delay",
                      style: heading16),
                ],
              ))
        ],
      ),
    );
  }
}
