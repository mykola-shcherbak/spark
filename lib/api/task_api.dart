import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:spark_test/model/task_model.dart';

class TaskApiClient {
  static const baseUrl = 'https://flutter.webspark.dev/';
  static const endpoint = '/flutter/api';
  static const post = 'post';

  static const String getRequestUrl =
      'https://flutter.webspark.dev/flutter/api';
  static const String postRequestUrl = '$baseUrl$post$endpoint';

  Future<dynamic> getTasks(String link) async {
    final uri = Uri.parse(link);
    final Map<String, String> queryParameters = uri.queryParameters;

    final Response response = await http.get(uri, headers: queryParameters);

    if (response.statusCode != 200) {
      throw HTTPException(response.statusCode, "unable to fetch tasks data");
    }

    final taskJson = json.decode(response.body);

    return taskJson['data'];
  }

  Future<void> postSolution(List<Task> tasksList) async {
    List<dynamic> params = tasksList.map((task) => getPerams(task)).toList();

    final Uri url = Uri.parse(postRequestUrl);
    try {
      final Response response = await http.post(url, body: jsonEncode(params));
      if (response.statusCode == 200) {}
    } catch (e) {
      throw HTTPException(e.hashCode, "unable to post tasks solution");
    }
  }
}

class HTTPException implements Exception {
  final int code;
  final String message;

  HTTPException(this.code, this.message);

  @override
  String toString() {
    return 'HTTPException{code: $code, message: $message}';
  }
}

getPerams(Task task) {
  final steps = coordinateTojson(task.steps ?? []);
  return {
    "id": task.id,
    "result": {"steps": steps, "path": task.path}
  };
}

List<Map<String, String>> coordinateTojson(List<Coordinates> steps) {
  return steps
      .map((step) => {"x": step.x.toString(), "y": step.y.toString()})
      .toList();
}
