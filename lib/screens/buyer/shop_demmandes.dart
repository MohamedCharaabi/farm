import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';

class ShopDemmandes extends StatelessWidget {
  const ShopDemmandes({Key? key}) : super(key: key);

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
            height: _responsive.getHeight(0.3),
            width: _responsive.width,
            child: Card(
              child: Row(
                children: <Widget>[
                  // image
                  Container(
                    width: _responsive.getWidth(0.3),
                    padding: const EdgeInsets.all(3.0),
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        centerSlice: Rect.largest,
                        image: AssetImage(
                          'assets/images/apples.jpg',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/sell_post_detail');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Apple', style: heading16),
                                Text('120L', style: heading16),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const Icon(Icons.place),
                                      Flexible(
                                        child: Text(
                                          'EL Ghrifetfff, El Fahs',
                                          style: heading16.copyWith(
                                              // color: mainColor,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('\$10-20', style: heading16)
                              ],
                            ),
                            Text(
                                'this my new cows milk which is fresh with top recommended safety',
                                style: regular14pt.copyWith(
                                    overflow: TextOverflow.ellipsis)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text('12/12/2020', style: regular14pt),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
