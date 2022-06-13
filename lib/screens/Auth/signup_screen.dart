import 'package:farm_mobile/componnents/custom_check_box.dart';
import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/data.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/screens/Auth/signin_screen.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  String _userType = farmerConst;

  int _selectedUser = 1;
  void toggleUser(int index, String userType) {
    setState(() {
      _selectedUser = index;
      _userType = userType;
    });
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: AuthClipPath(),
                child: Container(
                  color: mainColor,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register new\naccount',
                        style: heading2.copyWith(color: textWhiteGrey),
                      ),
                      kSizedBox20,
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      kSizedBox30,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          // border: Border.all(
                          //   color: mainColor,
                          // ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  toggleUser(0, buyerConst);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: _selectedUser == 0
                                          ? mainColor
                                          : backgroundColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Text(
                                      'Buyer',
                                      style: regular16pt.copyWith(
                                          color: _selectedUser == 0
                                              ? white
                                              : Colors.black),
                                    ))),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  toggleUser(1, farmerConst);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _selectedUser == 1
                                        ? mainColor
                                        : backgroundColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                      child: Text(
                                    'Farmer',
                                    style: regular16pt.copyWith(
                                        color: _selectedUser == 1
                                            ? white
                                            : Colors.black),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  toggleUser(2, transporterConst);
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: _selectedUser == 2
                                          ? mainColor
                                          : backgroundColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Text(
                                      'Transporter',
                                      style: regular16pt.copyWith(
                                          color: _selectedUser == 2
                                              ? white
                                              : Colors.black,
                                          overflow: TextOverflow.ellipsis),
                                    ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox10,
                      Form(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              decoration: BoxDecoration(
                                color: textWhiteGrey,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'username',
                                  hintStyle: heading6.copyWith(color: textGrey),
                                  icon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            kSizedBox30,
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              decoration: BoxDecoration(
                                color: textWhiteGrey,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: 'Email',
                                  hintStyle: heading6.copyWith(color: textGrey),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            kSizedBox30,
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              decoration: BoxDecoration(
                                color: textWhiteGrey,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: heading6.copyWith(color: textGrey),
                                  icon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    color: textGrey,
                                    splashRadius: 1,
                                    icon: Icon(passwordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: togglePassword,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            kSizedBox10,
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              decoration: BoxDecoration(
                                color: textWhiteGrey,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: heading6.copyWith(color: textGrey),
                                  icon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    color: textGrey,
                                    splashRadius: 1,
                                    icon: Icon(passwordVisible
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: togglePassword,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      kSizedBox30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCheckbox(),
                          kSizedBox10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'By creating an account, you agree to our',
                                style: regular16pt.copyWith(
                                    color: textGrey,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                'Terms & Conditions',
                                style: regular16pt.copyWith(color: primaryBlue),
                              ),
                            ],
                          ),
                        ],
                      ),
                      kSizedBox30,
                      CustomPrimaryButton(
                          buttonColor: primaryBlue,
                          textValue: 'Register',
                          textColor: Colors.white,
                          onClick: () async {
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();

                            _prefs.setString('user_type', _userType);

                            switch (_userType) {
                              case farmerConst:
                                Navigator.pushNamed(context, '/main');
                                break;
                              case transporterConst:
                                Navigator.pushNamed(
                                    context, '/transporter_main');
                                break;
                              default:
                                Navigator.pushNamed(context, '/buyer_main');
                                break;
                            }
                          }),
                      kSizedBox30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: regular16pt.copyWith(color: textGrey),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/signin');
                            },
                            child: Text(
                              'Login',
                              style: regular16pt.copyWith(color: primaryBlue),
                            ),
                          ),
                        ],
                      ),
                      kSizedBox20
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
