// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/LoginScreen.dart';
import 'package:flutter_proj/pages/SignupPage.dart';
import 'package:flutter_proj/pages/Signup_complete.dart';
import 'package:flutter_proj/pages/home.dart';
import 'package:get/get.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Padding(
          padding: EdgeInsets.only(bottom: 20,right: 20,left: 20),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedLabelStyle: TextStyle(
              fontFamily: 'Montserrat'
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Montserrat'
            ),
            showUnselectedLabels: true,
            currentIndex: controller.selectedIndex.value,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.black,
            onTap: (index) => controller.selectedIndex.value = index,
            items: [
              NavigationDestination(
                icon: Icon(
                  Icons.grid_view_rounded,
                  size: 40,
                ),
                label: "Home",
                index: 0,
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.store,
                  size: 40,
                ),
                label: "Store",
                index: 1,
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.history,
                  size: 40,
                ),
                label: "History",
                index: 2,
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.more_horiz_outlined,
                  size: 40,
                ),
                label: "More",
                index: 3,
              ),
            ].map((destination) {
              return BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.selectedIndex.value == destination.index
                        ? Color.fromARGB(255, 88, 196, 160)
                        : Colors
                            .transparent, // Set the background color to transparent for unselected items
                  ),
                  padding: EdgeInsets.all(15),
                  child: destination.icon,
                ),
                label: destination.label,
              );
            }).toList(),
            // Set the background color directly on BottomNavigationBar
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationDestination {
  final Icon icon;
  final String label;
  final int index;

  NavigationDestination({
    required this.icon,
    required this.label,
    required this.index,
  });
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [Home(), LoginScreen(), SignUpPage(), SignupComplete()];
}
