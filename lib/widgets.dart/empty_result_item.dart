import 'package:flutter/material.dart';
import 'package:spark_test/constants/color_constants.dart';

Widget emptyResultItem() {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration:
        const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
    child: Container(
      height: 70,
      color: ColorConstants.emptyListItem,
    ),
  );
}
