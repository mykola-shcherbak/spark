import 'package:flutter/material.dart';
import 'package:spark_test/model/task_model.dart';
import 'package:spark_test/utils/cell_color_utills.dart';

class CustomTableCell extends StatelessWidget {
  final double height;
  final String value;
  final Coordinates currentPosition;
  final Coordinates startPosition;
  final Coordinates endPosition;
  final List<Coordinates> steps;

  const CustomTableCell({
    super.key,
    required this.height,
    required this.value,
    required this.steps,
    required this.currentPosition,
    required this.startPosition,
    required this.endPosition,
  });

  @override
  Widget build(BuildContext context) {
    final bool isBlocked = value == 'X';
    final Color cellColor =
        getColor(steps, currentPosition, startPosition, endPosition, isBlocked);
    final String positionText = '(${currentPosition.x},${currentPosition.y})';

    return Container(
      decoration: BoxDecoration(
        color: cellColor,
        border: Border.all(color: Colors.black, width: 2),
      ),
      height: height,
      child: Center(
        child: Text(
          positionText,
          style: TextStyle(color: isBlocked ? Colors.white : null),
        ),
      ),
    );
  }
}
