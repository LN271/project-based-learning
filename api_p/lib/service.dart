import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';
class ApiService {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data from the server');
    }
  }
}