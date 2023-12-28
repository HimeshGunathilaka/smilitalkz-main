// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/bluetooth_page.dart';
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

class SignupComplete extends StatelessWidget {
  const SignupComplete({super.key});

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#40C49E");
    Color btncolor1 = HexColor("#FF948B");
    // Color btncolor2 = HexColor("#DE8179");
    // Color bordercolor = HexColor("#DE8179");
    // Color textColor = HexColor("#FAF8EB");
    // Color textColor2 = HexColor("#08293B");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 250, 247, 231),
      body: Stack(children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: CommonColors.mint,
                    size: 50,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Completed",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: CommonColors.mint,
                          fontSize: 50))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 180.0,
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
                            Get.to(() => BluetoothPage(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btncolor1,
                            shadowColor: btncolor1,
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            'Let\'s get started',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
        Positioned(
          bottom: 20.0,
          right: 0,
          child: SvgPicture.asset(
            'assests/images/ele2.svg', // Make sure the path is correct
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
