// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_proj/pages/bt_devices.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../utils/ColorsInfo.dart';
import 'package:get/get.dart';
import 'package:animated_widgets/animated_widgets.dart';

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

class BluetoothSearch extends StatelessWidget {
  const BluetoothSearch({super.key});

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#40C49E");
    Color btncolor1 = HexColor("#FF948B");

    Future.delayed(const Duration(seconds: 15), () {
      // Navigate to BtDevices using Get.to
      Get.to(() => BtDevices(), transition: Transition.rightToLeft);
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 250, 247, 231),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Searching for',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 25,
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Device',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        // Get.to(() => const BluetoothSearch());
                      },
                      child: Lottie.asset(
                        'assests/animations/bluetooth.json',
                      )),
                ],
              ),
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Make sure Device is turned on',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                ),
              ),
            ]),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Container(
              child: Row(
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
              ),
            )
          ],
        )
      ]),
    );
  }
}
