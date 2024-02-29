import 'package:flutter/material.dart';
import 'package:spark_test/constants/color_constants.dart';
import 'package:spark_test/model/task_model.dart';

Color getColor(
  List<Coordinates> steps,
  Coordinates currentPosition,
  Coordinates startPosition,
  Coordinates endPosition,
  bool isBlocked,
) {
  final String currentPositionString = positionToString(currentPosition);
  final String startPositionString = positionToString(startPosition);
  final String endPositionString = positionToString(endPosition);
  final List<String> stepsListString =
      steps.map((e) => positionToString(e)).toList();
  if (isBlocked) {
    return ColorConstants.blockedCell;
  } else if (currentPositionString == endPositionString) {
    return ColorConstants.endPositionCell;
  } else if (currentPositionString == startPositionString) {
    return ColorConstants.startPositionCell;
  } else if (stepsListString.contains(currentPositionString)) {
    return ColorConstants.stepCell;
  } else {
    return ColorConstants.emptyCell;
  }
}

String positionToString(Coordinates position) {
  return '${position.x}${position.y}';
}
