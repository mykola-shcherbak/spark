part of 'tasks_list_cubit.dart';

class TasksListState {
  List<Task> tasksList;
  Task selectedTask;
  bool isSolved;
  String link;
  bool isLoading;
  double loadingProcess;

  TasksListState copyWith({
    List<Task>? tasksList,
    Task? selectedTask,
    bool? isSolved,
    String? link,
    bool? isLoading,
    double? loadingProcess,
  }) {
    return TasksListState(
      tasksList: tasksList ?? this.tasksList,
      selectedTask: selectedTask ?? this.selectedTask,
      isSolved: isSolved ?? this.isSolved,
      link: link ?? this.link,
      isLoading: isLoading ?? this.isLoading,
      loadingProcess: loadingProcess ?? this.loadingProcess,
    );
  }

  TasksListState({
    required this.tasksList,
    required this.isSolved,
    required this.selectedTask,
    required this.link,
    required this.isLoading,
    required this.loadingProcess,
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
          isLoading: false,
          loadingProcess: 0,
        );
}
