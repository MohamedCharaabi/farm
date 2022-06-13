import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/domain/models/user.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:farm_mobile/utils/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userType = prefs.getString('user_type');
    switch (userType) {
      case farmerConst:
        context.read<UserProvider>().setUserType(UserType.farmer);

        Future.delayed(const Duration(seconds: 2)).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false));
        break;
      case transporterConst:
        context.read<UserProvider>().setUserType(UserType.transporter);

        Future.delayed(const Duration(seconds: 2)).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/transporter_main', (route) => false));

        break;
      case buyerConst:
        context.read<UserProvider>().setUserType(UserType.buyer);

        Future.delayed(const Duration(seconds: 2)).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/buyer_main', (route) => false));
        break;
      default:
        Future.delayed(const Duration(seconds: 2)).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/signin', (route) => false));
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.white,
                height: ResponsiveScreen(context).isSmallScreen ? 200 : 250,
                width: ResponsiveScreen(context).isSmallScreen ? 200 : 250,
                child: Image.asset('assets/images/logo.png')),
            Text(
              'EL VACHE',
              style: heading16.copyWith(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
