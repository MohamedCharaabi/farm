import 'package:farm_mobile/componnents/tab_buy.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/screens/buyer/shop_demmandes.dart';
import 'package:farm_mobile/screens/buyer/shop_history.dart';
import 'package:farm_mobile/utils/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyerMainScreen extends StatefulWidget {
  const BuyerMainScreen({Key? key}) : super(key: key);

  @override
  State<BuyerMainScreen> createState() => _BuyerMainScreenState();
}

class _BuyerMainScreenState extends State<BuyerMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, user, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: mainColor,
            title: const Text(
              'Buyer',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/buyer_profile');
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
              const SizedBox(width: 10),
            ],
            bottom: TabBar(
              indicatorColor: white,
              tabs: const [
                Tab(text: 'Shop'),
                Tab(text: 'Demandes'),
                Tab(text: 'history'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TabBuy(),
              ShopDemmandes(),
              ShopHistory(),
            ],
          ),
        ),
      );
    });
  }
}
