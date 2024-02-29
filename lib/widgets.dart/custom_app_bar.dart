import 'package:flutter/material.dart';
import 'package:spark_test/constants/color_constants.dart';

PreferredSizeWidget appBar(
    BuildContext context, String title, VoidCallback? callback) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: ColorConstants.appBarTittle),
    ),
    leading: callback != null
        ? IconButton(
            icon: Icon(Icons.arrow_back, color: ColorConstants.appBarTittle),
            onPressed: callback,
          )
        : null,
    centerTitle: true,
    backgroundColor: ColorConstants.accentColor,
  );
}
