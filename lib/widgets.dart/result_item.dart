import 'package:flutter/material.dart';

Widget resultItem(String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 70,
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
      ),
    ),
  );
}
