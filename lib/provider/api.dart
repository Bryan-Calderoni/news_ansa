import 'dart:async';
import 'dart:convert';
import 'package:fudeo_test_ansa/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> topHeadlines() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?sources=ansa&apiKey=${yourapi}');
  List articles = json.decode(response.body)["articles"];
  return articles.map((data) => Article.fromData(data)).toList();
}

Future<List<Article>> everything() async {
  final response = await http
      .get('https://newsapi.org/v2/everything?sources=ansa&apiKey=${yourapi}');
  List articles = json.decode(response.body)["articles"];

  return articles.map((data) => Article.fromData(data)).toList();
}
