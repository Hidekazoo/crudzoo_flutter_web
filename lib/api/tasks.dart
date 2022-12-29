import 'dart:convert';
import 'package:http/http.dart' as http;

class TasksApi {
  Future<List<TasksResponse>> fetchTasks() async {
    final response = await http.get(Uri.parse(
        '${const String.fromEnvironment('API_ENDPOINT', defaultValue: "")}/tasks'));

    if (response.statusCode == 200) {
      var items = (jsonDecode(response.body)['data'] as List)
          .map((e) => TasksResponse.fromJson(e))
          .toList();
      return items;
    } else {
      throw Exception("Failed to fetch worth doing later");
    }
  }
}

Future<List<TasksResponse>> fetchTasks() async {
  final response = await http.get(Uri.parse(
      '${const String.fromEnvironment('API_ENDPOINT', defaultValue: "")}/tasks'));
  if (response.statusCode == 200) {
    var items = (jsonDecode(response.body)['data'] as List)
        .map((e) => TasksResponse.fromJson(e))
        .toList();
    return items;
  } else {
    throw Exception("Failed to fetch tasks");
  }
}

class TasksResponse {
  final String id;
  final String subject;
  final String link;
  final String body;

  const TasksResponse(
      {required this.id,
      required this.subject,
      required this.link,
      required this.body});

  factory TasksResponse.fromJson(Map<String, dynamic> json) {
    return TasksResponse(
        id: json['id'],
        subject: json['subject'],
        link: json['link'],
        body: json['body']);
  }
}
