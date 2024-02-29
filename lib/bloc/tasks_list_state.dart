part of 'tasks_list_cubit.dart';

class TasksListState {
  List<Task> tasksList;
  Task selectedTask;
  bool isSolved;
  String link;
  bool isLoaded;
  double loadingProcess;

  TasksListState copyWith({
    List<Task>? tasksList,
    Task? selectedTask,
    bool? isSolved,
    String? link,
    bool? isLoaded,
    double? loadingProcess,
  }) {
    return TasksListState(
      tasksList: tasksList ?? this.tasksList,
      selectedTask: selectedTask ?? this.selectedTask,
      isSolved: isSolved ?? this.isSolved,
      link: link ?? this.link,
      isLoaded: isLoaded ?? this.isLoaded,
      loadingProcess: loadingProcess ?? this.loadingProcess,
    );
  }

  TasksListState({
    required this.tasksList,
    required this.isSolved,
    required this.selectedTask,
    required this.link,
    required this.isLoaded,
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
          isLoaded: false,
          loadingProcess: 0,
        );
}
