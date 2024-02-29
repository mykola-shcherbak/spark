import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_test/bloc/tasks_list_cubit.dart';
import 'package:spark_test/constants/text_constants.dart';
import 'package:spark_test/model/task_model.dart';
import 'package:spark_test/screens/preview_screen.dart';
import 'package:spark_test/utils/task_solution_utills.dart';
import 'package:spark_test/widgets.dart/custom_app_bar.dart';
import 'package:spark_test/widgets.dart/empty_result_item.dart';
import 'package:spark_test/widgets.dart/result_item.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  static String path = '/result_screen';
  static String route = 'result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, TextConstants.resultScreen, context.pop),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<TasksListCubit, TasksListState>(
              builder: (context, state) {
                final List<Task> tasksList = state.tasksList;
                return Expanded(
                  child: ListView.builder(
                      itemCount: max(tasksList.length, 20),
                      itemBuilder: (context, index) {
                        if (index >= tasksList.length) {
                          return emptyResultItem();
                        }

                        final title = state.tasksList[index].path ?? '';
                        void onTap() {
                          final Task task = tasksList[index];
                          context.read<TasksListCubit>().selectTask(task);
                          context.push(PreviewScreen.path);
                        }

                        return resultItem(title, onTap);
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
