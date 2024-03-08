import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:newsapp/data/models/news.dart'; // Import the News model
import 'package:http/http.dart' as http;

Future<List<News>> fetchNews(String apiKey) async {
  final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey'));
  if (response.statusCode == 200) {
    final List<dynamic> newsData = jsonDecode(response.body)['articles'];
    return newsData.map((article) => News.fromJson(article)).toList();
  } else {
    throw Exception('Failed to load news');
  }
}
