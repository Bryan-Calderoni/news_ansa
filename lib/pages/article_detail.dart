import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fudeo_test_ansa/models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;
  ArticleDetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notizia Corrente'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              launch(article.url);
            },
            icon: Icon(
              Icons.link,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12)),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.teal),
              child: Text(
                'ANSA',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              article.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Text(
              article.content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
