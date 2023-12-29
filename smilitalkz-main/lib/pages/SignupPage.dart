// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_proj/components/bottom_color_line.dart';
import 'package:flutter_proj/components/custom_input_field.dart';
import 'package:flutter_proj/components/custom_password_field.dart';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_proj/pages/Signup_complete.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/ColorsInfo.dart';
import 'package:get/get.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class PasswordStrengthIndicator extends StatelessWidget {
  final int strengthLevel; // 0 for weak, 1 for medium, 2 for strong

  PasswordStrengthIndicator({required this.strengthLevel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleIndicator(color: _getIndicatorColor(0)),
        CircleIndicator(color: _getIndicatorColor(1)),
        CircleIndicator(color: _getIndicatorColor(2)),
      ],
    );
  }

  Color _getIndicatorColor(int level) {
    switch (level) {
      case 0:
        return strengthLevel == 0 ? Colors.red : Colors.grey;
      case 1:
        return strengthLevel == 1 ? Colors.orange : Colors.grey;
      case 2:
        return strengthLevel == 2 ? Colors.green : Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class CircleIndicator extends StatelessWidget {
  final Color color;

  CircleIndicator({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final PasswordController _passwordController = PasswordController();
  final PasswordController _confirmPasswordController = PasswordController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#40C49E");
    Color btncolor1 = HexColor("#FF948B");
    Color formColor = HexColor("#D1FFF2");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 250, 247, 231),
      body: Padding(
        padding: EdgeInsets.only(top: 16, left: 0, right: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          letterSpacing: -2.0,
                          fontFamily: "Montserrat",
                          fontSize: 35,
                          color: btncolor1,
                          fontWeight: FontWeight.w900,
                        ),
                      ).paddingOnly(top: 30),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(labelText: 'Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(labelText: 'Email'),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!GetUtils.isEmail(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: TextFormField(
                                controller: _ageController,
                                decoration: InputDecoration(labelText: 'Age'),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your age';
                                  } else if (!GetUtils.isNumericOnly(value)) {
                                    return 'Please enter a valid age';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: TextFormField(
                                controller: _genderController,
                                decoration:
                                    InputDecoration(labelText: 'Gender'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your gender';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: TextFormField(
                                controller: _locationController,
                                decoration:
                                    InputDecoration(labelText: 'Location'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your location';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_passwordController.passwordStrength.value == 0)
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                'Password is not strong enough',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 18.0),
                            child: PasswordStrengthIndicator(
                                strengthLevel:
                                    _passwordController.passwordStrength.value),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: CustomPasswordField(
                                labelText: 'Password',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 25,
                                left: 8.0,
                                right: 8.0,
                              ),
                              child: CustomPasswordField(
                                labelText: 'Confirm Password',
                                validator: (value) {
                                  if (value != 'Password' || value.isEmpty) {
                                    return 'Your password doesn\'t match ';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: SizedBox(
                                  width: 130.0,
                                  height: 40.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      gradient: LinearGradient(colors: [
                                        CommonColors.dusk,
                                        CommonColors.dusk,
                                      ]),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState?.validate() ??
                                            false) {
                                          // Validation passed, proceed with signup
                                          Get.to(() => SignupComplete(),
                                              transition:
                                                  Transition.rightToLeft,
                                              duration: Duration(seconds: 1));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: btncolor1,
                                        shadowColor: btncolor1,
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                        color: CommonColors.dusk,
                                        fontSize: 15,
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.to(() => LoginScreen());
                                    },
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(
                                        color: CommonColors.salman,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    'assests/images/vector.png',
                                    width: 10,
                                    height: 10,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 25, 34, 82),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Facebook sign-in
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.facebook, size: 18),
                                    SizedBox(width: 2),
                                    Text(
                                      "Facebook",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 25, 34, 82),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Google sign-in
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.google, size: 16),
                                    SizedBox(width: 5),
                                    Text(
                                      "Google",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Apple sign-in
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.apple_outlined, size: 18),
                                    SizedBox(width: 3),
                                    Text(
                                      "Apple",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text('By sigin up you are agreeing to'))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'our Terms of Services',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, letterSpacing: 0),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View our',
                            style: TextStyle(letterSpacing: 0),
                          ),
                          Text(' Privacy Policy',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    Expanded(child: Container());
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: CommonColors.salman,
            width: 250,
            height: 20,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: CommonColors.mint,
            width: 250,
            height: 20,
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: CommonColors.dusk,
            width: 250,
            height: 20,
          ),
        ),
      ],
    );
  }
}
