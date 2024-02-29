import 'package:spark_test/api/task_api.dart';
import 'package:spark_test/model/task_model.dart';

class TaskRepository {
  final TaskApiClient taskApiClient;
  TaskRepository({required this.taskApiClient});

  Future<List<Task>> getTasks(String link) async {
    List<dynamic> tasksListJson = await taskApiClient.getTasks(link);

    return tasksListJson.map((e) => Task.fromJson(e)).toList();
  }

  Future<void> postSolution(List<Task> tasksList) async {
    await taskApiClient.postSolution(tasksList);
  }
}
