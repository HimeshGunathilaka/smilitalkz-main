// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_proj/components/Popups/unregistered_alert_popup.dart';
import 'dart:async';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../utils/ColorsInfo.dart';
import 'package:get/get.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      // ignore: prefer_interpolation_to_compose_strings
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Delayed execution of the alert dialog after 15 seconds
    Timer(Duration(seconds: 15), () {
      showUnregisteredDeviceAlert();
    });
  }

  void showUnregisteredDeviceAlert() {
    Get.dialog(UnRegPopup(),
        barrierDismissible:
            false); // Use GetX's Get.dialog to show your custom dialog
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#40C49E");
    Color btncolor1 = HexColor("#FF948B");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 250, 247, 231),
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            'assests/images/homeBackground.svg', // Replace with your SVG image asset
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 35,
              sigmaY: 35), // Adjust the sigma values for more/less blur
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assests/images/logo.svg',
                    width: 150,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 50,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          'assests/images/elephantHome.svg',
                          height: MediaQuery.of(context).size.height / 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 0,
                        child: Container(
                          width: 53,
                          height: 56,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: CommonColors.mint,
                              width: 3.0,
                            ),
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value:
                                    0.74, // Set the value according to the percentage (74%)
                                strokeWidth: 6.0,
                                valueColor:
                                    AlwaysStoppedAnimation(CommonColors.mint),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Icon(
                                    Icons.electric_bolt,
                                    size: 15,
                                    color: CommonColors.mint,
                                  ),
                                  Text(
                                    '74%',
                                    style: TextStyle(
                                      color: CommonColors.mint,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Elephant',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.circle_rounded,
                color: CommonColors.mint,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Connected',
                style: TextStyle(
                    fontFamily: "Montserrat", fontSize: 18, letterSpacing: 0),
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
