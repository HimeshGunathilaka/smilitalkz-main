import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/ColorsInfo.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using GetX delay method to wait for 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to LoginScreen using Get.to
      Get.to(() => LoginScreen(), transition: Transition.rightToLeft);
    });

    return Scaffold(
      backgroundColor: Color(0xFFFAF8EB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assests/images/logo.svg',
                width: 200,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
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
                flex: 2,
                child: Container(
                  color: CommonColors.dusk,
                  width: 250,
                  height: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
