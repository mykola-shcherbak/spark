import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_test/bloc/tasks_list_cubit.dart';
import 'package:spark_test/constants/text_constants.dart';
import 'package:spark_test/model/task_model.dart';
import 'package:spark_test/utils/task_solution_utills.dart';
import 'package:spark_test/widgets.dart/custom_app_bar.dart';
import 'package:spark_test/widgets.dart/custom_table_cell.dart';
import 'package:collection/collection.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  static String path = '/preview_screen';
  static String route = 'preview_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, TextConstants.previewScreen, context.pop),
      body: BlocBuilder<TasksListCubit, TasksListState>(
        builder: (context, state) {
          final Task selectedTask = state.selectedTask;
          final List<String> field = selectedTask.field;
          final List<Coordinates> steps = selectedTask.steps ?? [];
          final Coordinates startPosition = selectedTask.start;
          final Coordinates endPosition = selectedTask.end;

          // final String path = testTask.path ?? '';
          // // final Task selectedTask = testTask;
          // final Task test = testTask;
          // final List<String> field = testTask.field;
          // final List<Coordinates> steps = testTask.steps ?? [];
          // final Coordinates startPosition = testTask.start;
          // final Coordinates endPosition = testTask.end;

          // final String path = selectedTask.path ?? '';

          return Column(
            children: [
              Table(
                children: field.mapIndexed((indexY, row) {
                  final List<String> splittedRow = row.split('').toList();
                  final height = MediaQuery.of(context).size.width / row.length;
                  return TableRow(
                    children: splittedRow.mapIndexed((indexX, cell) {
                      final Coordinates currentPosition =
                          Coordinates(indexX, indexY);

                      return CustomTableCell(
                        height: height,
                        value: cell,
                        currentPosition: currentPosition,
                        startPosition: startPosition,
                        endPosition: endPosition,
                        steps: steps,
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Text(
                path,
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                  onPressed: () {
                    // solveTask(test);
                    solveTask(selectedTask);
                  },
                  icon: const Icon(Icons.add))
            ],
          );
        },
      ),
    );
  }
}
