// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_proj/utils/ColorsInfo.dart';
import 'package:get/get.dart';
import 'package:animated_widgets/animated_widgets.dart';

class UnRegPopup extends StatelessWidget {
  const UnRegPopup({super.key});

  @override
  Widget build(BuildContext context) {

    Color btncolor1 = HexColor("#FF948B");
    // Color btncolor2 = HexColor("#DE8179");

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: CommonColors.salman,
            width: 1,
          ),
          color: Color(0xff08293B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Unregistered Device Alert",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "This device is not registered please use below button and register your toy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 18, bottom: 5,),
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
                          // Get.to(
                          //   // () => CustomNavigationBar(),
                          //   // transition: Transition.rightToLeft,
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btncolor1,
                          shadowColor: btncolor1,
                          shape: StadiumBorder(),
                        ),
                        child: Text(
                          'Register',
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
            ],
          ),
        ),
      ),
    );
  }
}
