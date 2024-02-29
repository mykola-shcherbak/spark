import 'package:flutter/material.dart';
import 'package:spark_test/constants/color_constants.dart';

Widget customButton(String title, VoidCallback? onPress) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.maxFinite, 50),
      backgroundColor: ColorConstants.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    onPressed: onPress,
    child: Text(
      title,
      style: TextStyle(color: ColorConstants.buttonTitile),
    ),
  );
}
