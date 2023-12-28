// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_proj/pages/bluetooth_search_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/ColorsInfo.dart';
import 'package:get/get.dart';

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

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#40C49E");
    Color btncolor1 = HexColor("#FF948B");

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
                  'Looks like your',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 25,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bluetooth is',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' turned off',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: CommonColors.salman),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const BluetoothSearch(),
                            transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                    },
                    child: SvgPicture.asset(
                      'assests/images/bluetooth.svg',
                    ),
                  ),
                ],
              ),
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'App requires bluetooth services to operate',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                ),
              ),
            ]),
            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'with the physical device',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15,
                ),
              )
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
