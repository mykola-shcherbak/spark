part of 'tasks_list_cubit.dart';

class TasksListState {
  List<Task> tasksList;
  Task selectedTask;
  bool isSolved;
  String link;

  TasksListState copyWith({
    List<Task>? tasksList,
    Task? selectedTask,
    bool? isSolved,
    String? link,
  }) {
    return TasksListState(
      tasksList: tasksList ?? this.tasksList,
      selectedTask: selectedTask ?? this.selectedTask,
      isSolved: isSolved ?? this.isSolved,
      link: link ?? this.link,
    );
  }

  TasksListState({
    required this.tasksList,
    required this.isSolved,
    required this.selectedTask,
    required this.link,
  });
}

class InitialTaskState extends Task {
  InitialTaskState()
      : super(
          id: 'empty',
          field: [],
          start: Coordinates(0, 0),
          end: Coordinates(2, 2),
          steps: [],
        );
}

class InitialTasksListState extends TasksListState {
  InitialTasksListState()
      : super(
          tasksList: [],
          selectedTask: InitialTaskState(),
          isSolved: false,
          link: TaskApiClient.getRequestUrl,
        );
}
