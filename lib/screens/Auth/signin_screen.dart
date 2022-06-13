import 'package:farm_mobile/componnents/custom_primary_button.dart';
import 'package:farm_mobile/constants/colors.dart';
import 'package:farm_mobile/constants/styles.dart';
import 'package:farm_mobile/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                        'Login to your\naccount',
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
                    children: <Widget>[
                      kSizedBox30,
                      Form(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: textWhiteGrey,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: heading6.copyWith(color: textGrey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            kSizedBox20,
                            Container(
                              decoration: BoxDecoration(
                                color: textWhiteGrey,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                obscureText: !passwordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: heading6.copyWith(color: textGrey),
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
                          ],
                        ),
                      ),
                      kSizedBox30,
                      CustomPrimaryButton(
                        buttonColor: primaryBlue,
                        textValue: 'Login',
                        textColor: Colors.white,
                        onClick: () => Navigator.pushNamed(context, '/main'),
                      ),
                      kSizedBox10,
                      Center(
                        child: Text(
                          'OR',
                          style: heading6.copyWith(color: textGrey),
                        ),
                      ),
                      kSizedBox10,
                      CustomPrimaryButton(
                        buttonColor: const Color(0xffc02e2c),
                        textValue: 'Login with Google',
                        textColor: textWhiteGrey,
                        icon: FontAwesomeIcons.google,
                        onClick: () {},
                      ),
                      kSizedBox30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: regular16pt.copyWith(color: textGrey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              'Register',
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

class AuthClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path()
      ..lineTo(0, size.height)
      ..arcToPoint(
        Offset(size.width, size.height * .5),
      )
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
