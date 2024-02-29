import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_test/api/task_api.dart';
import 'package:spark_test/bloc/tasks_list_cubit.dart';
import 'package:spark_test/repository/task_repository.dart';
import 'package:spark_test/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TaskRepository taskRepository = TaskRepository(
    taskApiClient: TaskApiClient(),
  );
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksListCubit(repository: taskRepository),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
