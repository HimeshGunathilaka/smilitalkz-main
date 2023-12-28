// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_proj/components/navigationBar.dart';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_proj/pages/home.dart';
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

class BtDevices extends StatelessWidget {
  BtDevices({super.key});

  final List<Map<String, dynamic>> devices = [
    {'name': 'Device 1', 'connected': true},
    {'name': 'Device 2', 'connected': false},
    {'name': 'Device 3', 'connected': true},
  ];

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
                  'Devices Found',
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Make sure device is turned on',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: devices.map((device) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                device['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 8),
                              Text(
                                device['connected']
                                    ? 'Connected'
                                    : 'Not Connected',
                              ),
                              SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                    // Navigate to the home screen when the Bluetooth icon is tapped
                                    Get.to(() => CustomNavigationBar(),
                                        transition: Transition.rightToLeft);
                                },
                                child: device['connected']
                                    ? Icon(
                                        Icons.bluetooth,
                                        color: Color.fromRGBO(2, 143, 2, 1),
                                      )
                                    : Icon(
                                        Icons.bluetooth_disabled,
                                        color: Color.fromRGBO(94, 94, 94, 1),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          // Add a divider below each row
                          color: Colors.black,
                          thickness: 1.0,
                          height: 20.0,
                          indent: 20.0,
                          endIndent: 20.0,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30.0,
          right: 10,
          child: SvgPicture.asset(
            'assests/images/rosebluetooth.svg', // Make sure the path is correct
            width: 150,
            height: 200,
            // fit: BoxFit.cover,
          ),
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
