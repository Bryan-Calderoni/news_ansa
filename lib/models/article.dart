import 'package:flutter/material.dart';

class Article {
  String content;
  String title;
  String url;
  String urlToImage;

  Article({
    @required this.content,
    @required this.title,
    @required this.url,
    @required this.urlToImage,
  });

  factory Article.fromData(dynamic data) {
    String content = data['description'];
    String title = data['title'];
    String url = data['url'];
    String urlToImage = data['urlToImage'];

    return Article(
        content: content, title: title, url: url, urlToImage: urlToImage);
  }
}
