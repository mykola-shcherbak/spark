import 'package:bloc/bloc.dart';
import 'package:spark_test/api/task_api.dart';
import 'package:spark_test/model/task_model.dart';
import 'package:spark_test/repository/task_repository.dart';
import 'package:spark_test/utils/task_solution_utills.dart';

part 'tasks_list_state.dart';

class TasksListCubit extends Cubit<TasksListState> {
  TasksListCubit({required this.repository}) : super(InitialTasksListState());

  final TaskRepository repository;

  Future<void> getTasks(String link) async {
    final List<Task> tasksList = await repository.getTasks(link);
    final List<Task> solvedTasksList =
        tasksList.map((task) => solveTask(task)).toList();

    emit(state.copyWith(tasksList: solvedTasksList, link: link));
  }

  Future<void> selectTask(Task task) async {
    emit(state.copyWith(selectedTask: task));
  }

  Future<void> postSolution() async {
    await repository.postSolution(state.tasksList);
  }
}
