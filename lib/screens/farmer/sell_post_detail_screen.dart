import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class SellPostDetailScreen extends StatelessWidget {
  const SellPostDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // coverImage
                Container(
                  height: _responsive.getHeight(0.4),
                  width: _responsive.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/apples.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/farmer_profile');
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
                                        image: AssetImage(
                                            'assets/images/profile.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Jamel Sassi',
                                  style: regular16pt,
                                )
                              ],
                            ),
                            // price
                            Text('200dt', style: heading16),
                          ],
                        ),
                        //  location
                        kSizedBox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.place),
                                Text('Cartage, Tunis'),
                              ],
                            ),
                            // accept
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(' Submit',
                                    style: heading16.copyWith(color: white)),
                              ),
                            ),
                          ],
                        ),
                        kSizedBox10,
                        // date
                        Text('12/12/2020', style: regular14pt),

                        kSizedBox20,
                        // description
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: regular16pt,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Positioned(
              top: 20.0,
              left: 15.0,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: white))),
        ],
      ),
    );
  }
}
