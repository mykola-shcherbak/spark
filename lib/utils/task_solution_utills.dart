import 'package:flutter/foundation.dart';
import 'package:spark_test/model/task_model.dart';

// Task testTask = Task(
//     id: 'test',
//     field: ['....', 'XXX.', '...X', '.XX.'],
//     start: Coordinates(0, 0),
//     end: Coordinates(0, 3));

Task solveTask(Task task) {
  Task solvedTask = task;

  // final List<int> start = coorditateToList(testTask.start);
  // final List<int> end = coorditateToList(testTask.end);
  // final List<List<int>> freeCells = fieldToCoordinate(testTask.field)
  //     .map((e) => coorditateToList(e))
  //     .toList();
  final List<int> start = coorditateToList(task.start);
  final List<int> end = coorditateToList(task.end);
  final List<List<int>> freeCells =
      fieldToCoordinate(task.field).map((e) => coorditateToList(e)).toList();

  List<int> currentPostion = [...start];
  final List<List<int>> steps = [start];
  print('START: $start/ END:$end/ CUR:$currentPostion / PATH:$steps');
  print('FREE: $freeCells');

  void stepBack(List<int> cur) {
    // steps.removeLast();
    // currentPostion = steps.last;
    freeCells.removeWhere((e) => listEquals(e, cur));
  }

  List<int> checkFastest(List<int> cur, {int x = 0, int y = 0}) {
    List<int>? d;
    print('checkFastest: $cur   $x $y');
    if (freeCells.any((e) => listEquals(e, [cur[0] + x, cur[1] + y]))) {
      print('11111: $cur   $x $y');
      return [cur[0] + x, cur[1] + y];
    } else if (freeCells.any((e) => listEquals(e, [cur[0], cur[1] + y])) &&
        y != 0) {
      print('2222: $cur   $x $y');
      return [cur[0], cur[1] + y];
    } else if (freeCells.any((e) => listEquals(e, [cur[0] + x, cur[1]])) &&
        x != 0) {
      print('33333: $cur   $x $y');
      return [cur[0] + x, cur[1]];
    } else {
      print('step back: $cur');
      int newX = x == 0 ? 0 : x * -1;
      int newY = y == 0 ? 0 : y * -1;
      d = checkFastest(cur, x: newX, y: newY);
    }
    return d;
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
    print('directinon: $directinon');

    List<int>? newStep =
        checkFastest(currentPostion, x: directinon[0], y: directinon[1]);
    print('currentPostion: $currentPostion');
    if (newStep != null) {
      currentPostion = newStep;
      steps.add(newStep);
    }
    print('steps: $steps');
  }

  //////////

  // while (!listEquals(currentPostion, end)) {
  //   List<int> newStep = [0, 0];
  //   for (int i = 0; i <= 1; i++) {
  //     if (currentPostion[i] < end[i]) {
  //       currentPostion[i]++;
  //       newStep[i] = currentPostion[i];
  //     } else if (currentPostion[i] > end[i]) {
  //       currentPostion[i]--;
  //       newStep[i] = currentPostion[i];
  //     } else {
  //       newStep[i] = currentPostion[i];
  //     }
  //     print('newStep[i] :${newStep[i]}');
  //   }

  //   steps.add(newStep);
  //   print('newPath:$newStep');
  //   print('newPath:$newStep');
  // }

  final List<Coordinates> solvedSteps = stepsListCoordinate(steps);
  final String path = stepsToString(steps);
  solvedTask.steps = solvedSteps;
  solvedTask.path = path;

  return solvedTask;
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
