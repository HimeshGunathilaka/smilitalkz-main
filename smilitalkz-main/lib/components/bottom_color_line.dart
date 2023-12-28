import 'package:flutter/material.dart';
import '../utils/ColorsInfo.dart';

class BottomImagesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
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
    );
  }
}
