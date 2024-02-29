import 'package:flutter/foundation.dart';
import 'package:spark_test/model/task_model.dart';

Task solveTask(Task task) {
  Task solvedTask = task;

  final List<int> start = coorditateToList(task.start);
  final List<int> end = coorditateToList(task.end);
  final List<List<int>> freeCells =
      fieldToCoordinate(task.field).map((e) => coorditateToList(e)).toList();

  List<int> currentPostion = [...start];
  final List<List<int>> steps = [start];

  List<List<int>> findStep(List<int> cur) {
    List<List<int>> list = [...freeCells];
    List<List<int>> newList = [cur];
    return newList;
  }

  List<int>? checkFastest(List<int> cur, {int x = 0, int y = 0}) {
    List<List<int>> field;
    if (freeCells.any((e) => listEquals(e, [cur[0] + x, cur[1] + y]))) {
      return [cur[0] + x, cur[1] + y];
    } else if (freeCells.any((e) => listEquals(e, [cur[0], cur[1] + y])) &&
        y != 0) {
      return [cur[0], cur[1] + y];
    } else if (freeCells.any((e) => listEquals(e, [cur[0] + x, cur[1]])) &&
        x != 0) {
      return [cur[0] + x, cur[1]];
    } else {
      field = findStep(cur);
      return field[0];
    }
  }

  int compare(int cur, int end) {
    if (cur < end) {
      return 1;
    } else if (cur > end) {
      return -1;
    }
    return 0;
  }

  List<int> compareList(List<int> cur) {
    List<int> result = [0, 0];
    result[0] = compare(cur[0], end[0]);
    result[1] = compare(cur[1], end[1]);

    return result;
  }

  while (!listEquals(currentPostion, end)) {
    List<int> directinon = compareList(currentPostion);

    List<int>? newStep =
        checkFastest(currentPostion, x: directinon[0], y: directinon[1]);
    if (newStep != null) {
      currentPostion = newStep;
      steps.add(newStep);
    }
  }

  final List<Coordinates> solvedSteps = stepsListCoordinate(steps);
  final String path = stepsToString(steps);

  return solvedTask.copyWith(steps: solvedSteps, path: path);
}

List<int> coorditateToList(Coordinates coordinate) {
  return [coordinate.x, coordinate.y];
}

List<Coordinates> fieldToCoordinate(List<String> field) {
  List<Coordinates> freePath = [];

  for (int i = 0; i < field.length; i++) {
    for (int z = 0; z < field.length; z++) {
      if (field[i][z] == '.') {
        freePath.add(Coordinates(z, i));
      }
    }
  }
  return freePath;
}

List<Coordinates> stepsListCoordinate(List<List<int>> steps) {
  List<Coordinates> coordinates = [];

  for (int i = 0; i < steps.length; i++) {
    coordinates.add(Coordinates(steps[i][0], steps[i][1]));
  }
  return coordinates;
}

String stepsToString(List<List<int>> steps) {
  return steps.map((step) => '(${step[0]},${step[1]})').toList().join('=>');
}
