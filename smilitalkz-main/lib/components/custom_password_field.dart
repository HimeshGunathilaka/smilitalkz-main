// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:flutter_proj/utils/ColorsInfo.dart';
import 'package:get/get.dart';
import '../utils/ColorsInfo.dart';
import 'package:flutter/foundation.dart';

class PasswordController extends GetxController {
  RxBool obscureText = true.obs;
  RxInt passwordStrength = 0.obs;

  void toggleObscureText() {
    obscureText.toggle();
  }

  void checkPasswordStrength(String password) {
    // Implement your password strength logic here
    int strength = 0;

    if (password.length >= 8 && _containsSymbol(password)) {
      strength = 2; // Strong
    } else if (password.length >= 6 && password.length <= 8) {
      strength = 1; // Medium
    } else {
      strength = 0; // Weak
    }

    debugPrint('passwordStrength: $strength');
    debugPrint('password: $password');

    // Use update method to notify listeners
    passwordStrength.value = strength;
    update();
  }

  bool _containsSymbol(String password) {
    // Implement your logic to check if the password contains symbols
    // You may use regular expressions or any other method
    return password.contains(RegExp(r'[!@#$%^&*?":{}|<>]'));
  }
}

class CustomPasswordField extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;

  CustomPasswordField({
    Key? key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late PasswordController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = Get.put(PasswordController());
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 300.0,
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: _passwordController.obscureText.value,
        onChanged: (password) {
          _passwordController.checkPasswordStrength(password);
        },
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: CommonColors.dusk, fontSize: 15),
          filled: true,
          fillColor: HexColor("#D1FFF2"),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            color: CommonColors.dusk,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: CommonColors.dusk),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: CommonColors.dusk),
          ),
          suffixIcon: InkWell(
            onTap: () {
              _passwordController.toggleObscureText();
              setState(() {}); // Trigger a rebuild when the obscureText changes
            },
            child: Icon(
              _passwordController.obscureText.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: CommonColors.dusk,
            ),
          ),
        ),
      ),
    );
  }
}
