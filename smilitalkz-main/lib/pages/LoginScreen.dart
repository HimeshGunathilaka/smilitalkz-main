// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_proj/components/navigationBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../pages/SignupPage.dart';
import '../utils/ColorsInfo.dart';

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

class LoginController extends GetxController {
  RxBool animate = false.obs;

  @override
  void onInit() {
    print("Starting Animation");
    super.onInit();
    startAnimation();
  }

  Future<void> startAnimation() async {
    Future.delayed(Duration(milliseconds: 5000));
    await animate(true);
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

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
      body: Stack(
        children: [
          // Top Section - Top Left
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            top: 40,
            left: controller.animate.value ? 0 : -220,
            child: SvgPicture.asset(
              'assests/images/ele.svg',
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          // Middle Section - Centered
          Column(
            children: [
              SizedBox(
                height: 290,
              ),
              Center(
                child: SvgPicture.asset(
                  'assests/images/logo.svg',
                  width: 150,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 25, bottom: 5, left: 20, right: 20),
                child: Center(
                  child: SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: CommonColors.dusk,
                          fontSize: 15,
                        ),
                        prefixIcon:
                            Icon(Iconsax.user, color: Colors.black, size: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color1, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        floatingLabelStyle:
                            TextStyle(color: CommonColors.dusk, fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonColors.dusk, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                child: Center(
                  child: SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: CommonColors.dusk,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon:
                            Icon(Iconsax.lock, color: Colors.black, size: 18),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color1, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: CommonColors.dusk,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: CommonColors.dusk, width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 180, right: 20),
                child: InkWell(
                  onTap: () {
                    // Handle the tap event here
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(148, 255, 148, 139),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 70,
          ),

          Padding(
            padding: EdgeInsets.only(top: 180, bottom: 5, left: 20, right: 20),
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
                      Get.to(
                        () => CustomNavigationBar(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btncolor1,
                      shadowColor: btncolor1,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      'Login',
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
          SizedBox(
            height: 100,
          ),

          Padding(
            padding: EdgeInsets.only(top: 270, bottom: 5, left: 20, right: 20),
            child: Center(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: CommonColors.dusk,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => SignUpPage(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Text(
                        'Sign Up',
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
          ),

          Padding(
            padding: EdgeInsets.only(top: 580, bottom: 0, left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 25, 34, 82),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          onPressed: () {
                            // Handle Facebook sign-in
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.facebook, size: 20),
                              SizedBox(width: 3),
                              Text(
                                "Facebook",
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 25, 34, 82),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          onPressed: () {
                            // Handle Google sign-in
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google, size: 18),
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
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 0, 0, 0),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          onPressed: () {
                            // Handle Apple sign-in
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.apple_outlined, size: 20),
                              SizedBox(width: 5),
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
              ],
            ),
          ),

          // Bottom Section - Bottom Right

          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            bottom: 20,
            right: controller.animate.value ? 0 : -220,
            child: SvgPicture.asset(
              'assests/images/dino.svg',
              width: 200,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),

          // Row of 3 Images at the Bottom
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
        ],
      ),
    );
  }
}
