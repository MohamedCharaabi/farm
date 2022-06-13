import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/screens/farmer/my_farm_screen.dart';
import 'package:farm_mobile/screens/farmer/views/farmer_dashoboard.dart';
import 'package:farm_mobile/screens/farmer/views/farmer_dashoboard2.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _pages = const [
    FarmerDashbord(),
    FarmerDashbord2(),
    MyFarmScreen()
  ];
  int _currentIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double height = Responsive(context).height;
    final double width = Responsive(context).width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/farmer_profile');
          },
          child: Container(
            height: 25,
            width: 25,
            padding: const EdgeInsets.all(5),
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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
        title: const Text(
          // AppLocalizations.of(context)!.helloWorld
          'Farmer',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Badge(
            badgeContent:
                const Text('3', style: TextStyle(color: Colors.white)),
            position: BadgePosition.topEnd(top: 2, end: -4),
            child: Icon(Icons.notifications_none_outlined, color: textBlack),
          ),
          const SizedBox(width: 20),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Icon(
                Icons.settings,
                color: Colors.black,
              )),
          const SizedBox(width: 10),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: [
          Icon(Icons.dashboard, size: 30, color: white),
          Icon(Icons.dashboard, size: 30, color: white),
          Icon(Icons.manage_history_outlined, size: 30, color: white),
        ],
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: const Color(0xff4aa162),
        color: const Color(0xff033323),
        height: 55,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],

      // body: Container(
      //   height: height,
      //   width: width,
      //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
      //   child: ListView(
      //     children: [
      //       Column(
      //         children: [
      //           //  Grid
      //           SizedBox(
      //             // height: 500,
      //             width: 400,
      //             child: GridView.builder(
      //               physics: const NeverScrollableScrollPhysics(),
      //               shrinkWrap: true,
      //               gridDelegate:
      //                   const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 // childAspectRatio: 1.0,
      //                 crossAxisSpacing: 10,
      //                 mainAxisSpacing: 10,
      //               ),
      //               itemCount: menuData.length,
      //               itemBuilder: (_, index) {
      //                 final CustomMenuItem _menuItem = menuData[index];
      //                 return Center(
      //                   child: InkWell(
      //                     onTap: () =>
      //                         Navigator.pushNamed(context, _menuItem.route),
      //                     child: Container(
      //                       margin: const EdgeInsets.all(10),
      //                       padding: const EdgeInsets.all(10),
      //                       decoration: BoxDecoration(
      //                         boxShadow: const [
      //                           BoxShadow(
      //                             color: Colors.greenAccent,
      //                             // spreadRadius: 1,
      //                             blurRadius: 5.0,
      //                             // offset: const Offset(0, 0),
      //                           )
      //                         ],
      //                         borderRadius: BorderRadius.only(
      //                           topLeft: Radius.circular(
      //                               index == 0 || index == 3 ? 0.0 : 50.0),
      //                           topRight: Radius.circular(
      //                               index == 1 || index == 2 ? 0.0 : 50.0),
      //                           bottomLeft: Radius.circular(
      //                               index == 1 || index == 2 ? 0.0 : 50.0),
      //                           bottomRight: Radius.circular(
      //                               index == 0 || index == 3 ? 0.0 : 50.0),
      //                         ),
      //                         color: Colors.white,
      //                       ),
      //                       child: Center(
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             SizedBox(
      //                               height: 50,
      //                               width: 50,
      //                               child: Image.asset(
      //                                 _menuItem.image,
      //                                 fit: BoxFit.contain,
      //                               ),
      //                             ),
      //                             Text(
      //                               _menuItem.label,
      //                               style: TextStyle(
      //                                 fontSize: ResponsiveScreen(context)
      //                                         .isSmallScreen
      //                                     ? 20
      //                                     : 30,
      //                                 fontWeight: FontWeight.bold,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //           kSizedBox20,
      //           // weather
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Container(
      //                 height: 200,
      //                 width: width * 0.4,
      //                 padding: const EdgeInsets.only(top: 20.0, left: 15.0),
      //                 decoration: BoxDecoration(
      //                   color: mainColor,
      //                   borderRadius: BorderRadius.circular(15.0),
      //                 ),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     tempratureMinMax(temp: 34, maxmin: 'max'),
      //                     kSizedBox10,
      //                     tempratureMinMax(temp: 32, maxmin: 'min'),
      //                   ],
      //                 ),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: width * 0.4,
      //                 padding: const EdgeInsets.only(top: 20.0, left: 15.0),
      //                 decoration: BoxDecoration(
      //                   color: mainColor,
      //                   borderRadius: BorderRadius.circular(15.0),
      //                 ),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     whetherRow(
      //                         icon: 'rain',
      //                         state: 'No Rain',
      //                         background: backgroundColor,
      //                         wh_element: 'rain'),
      //                     whetherRow(
      //                         icon: 'humidity',
      //                         state: '34%',
      //                         background: backgroundColor,
      //                         wh_element: 'humidity'),
      //                     whetherRow(
      //                         icon: 'wind',
      //                         state: '9.4 km/h',
      //                         background: backgroundColor,
      //                         wh_element: 'wind'),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //           kSizedBox10
      //         ],
      //       ),
      //       //   ),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }

  Column tempratureMinMax({required int temp, required String maxmin}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$temp°C ',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          maxmin,
          style: TextStyle(color: backgroundColor),
        )
      ],
    );
  }

  Padding whetherRow(
      {required String icon,
      required Color background,
      required String state,
      required String wh_element}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: background,
                image: DecorationImage(
                    image: AssetImage('assets/images/$icon.png'))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                state,
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                wh_element,
                style: TextStyle(color: backgroundColor, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
