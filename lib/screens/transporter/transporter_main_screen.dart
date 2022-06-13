import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class TransporterMainScreen extends StatefulWidget {
  const TransporterMainScreen({Key? key}) : super(key: key);

  @override
  _TransporterMainScreenState createState() => _TransporterMainScreenState();
}

class _TransporterMainScreenState extends State<TransporterMainScreen> {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Transporter',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/transporter_profil');
          },
          child: Container(
            height: 25,
            width: 25,
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
        actions: [
          // avatar image
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Icon(
                Icons.settings,
                color: Colors.black,
              )),
          Icon(
            Icons.notifications,
            color: Colors.amber,
          ),
        ],
      ),
      body: Container(
        height: _responsive.height,
        width: _responsive.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                //  Grid
                SizedBox(
                  // height: 500,
                  width: 400,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      final CustomMenuItem _menuItem =
                          transporter_menuData[index];
                      return InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, _menuItem.route),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.greenAccent,
                                // spreadRadius: 1,
                                blurRadius: 5.0,
                                // offset: const Offset(0, 0),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  index == 0 || index == 3 ? 0.0 : 50.0),
                              topRight: Radius.circular(
                                  index == 1 || index == 2 ? 0.0 : 50.0),
                              bottomLeft: Radius.circular(
                                  index == 1 || index == 2 ? 0.0 : 50.0),
                              bottomRight: Radius.circular(
                                  index == 0 || index == 3 ? 0.0 : 50.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    _menuItem.image,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  _menuItem.label,
                                  style: TextStyle(
                                    fontSize:
                                        ResponsiveScreen(context).isSmallScreen
                                            ? 20
                                            : 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                kSizedBox20,
                // whether
              ],
            ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
