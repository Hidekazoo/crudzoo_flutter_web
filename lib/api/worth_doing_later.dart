import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<WorthDoingLaterResponse>> fetchWorthDoingLater() async {
  final response = await http.get(Uri.parse('${const String.fromEnvironment('API_ENDPOINT', defaultValue: "")}/worth_doing_later'));

  if (response.statusCode == 200) {
    var items = (jsonDecode(response.body)['data'] as List).map((e) =>
      WorthDoingLaterResponse.fromJson(e)
    ).toList();
    return items;
  } else {
    throw Exception("Failed to fetch worth doing later");
  }
}


class WorthDoingLaterResponse {
  final String title;
  final String link;
  final String supplement;

  const WorthDoingLaterResponse({required this.title, required this.link, required this.supplement});

  factory WorthDoingLaterResponse.fromJson(Map<String, dynamic>json) {
    return WorthDoingLaterResponse(title: json['title'], link: json['link'], supplement: json['suppliment']);
  }
}