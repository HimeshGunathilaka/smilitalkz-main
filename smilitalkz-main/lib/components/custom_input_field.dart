// custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/ColorsInfo.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isPasswordVisible = RxBool(false);
    TextEditingController controller = TextEditingController();

    return SizedBox(
      height: 40.0,
      width: 300.0,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText && !isPasswordVisible.value,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: CommonColors.dusk, fontSize: 15),
          filled: true,
          fillColor: HexColor("#D1FFF2"),
          labelText: labelText,
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
          suffixIcon: obscureText
              ? GestureDetector(
                  onTap: () {
                    isPasswordVisible.toggle();
                    // Manually update the text to force the rebuild
                    controller.value = controller.value.copyWith(
                      text: controller.text,
                    );
                  },
                  child: Icon(
                    isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: CommonColors.dusk,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
