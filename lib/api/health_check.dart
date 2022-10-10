import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ApiStatus> fetchHealthCheck() async {
  final response = await http.get(Uri.parse('${const String.fromEnvironment('API_ENDPOINT', defaultValue: "test")}/health'));
  if (response.statusCode == 200) {
    return ApiStatus.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load health check');
  }
}

class ApiStatus {
  final String status;

  const ApiStatus({required this.status});

  factory ApiStatus.fromJson(Map<String, dynamic> json) {
    return ApiStatus(status: json['status']);
  }
}
