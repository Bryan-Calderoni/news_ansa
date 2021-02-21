import 'package:flutter/material.dart';
import 'package:fudeo_test_ansa/pages/article_detail.dart';
import 'package:fudeo_test_ansa/models/article.dart';
import 'package:fudeo_test_ansa/provider/api.dart';

class HistoryNewsPage extends StatelessWidget {
  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12)),
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
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: everything(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            List<Article> articles = snapshot.data;
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: EdgeInsets.all(16),
                children: List.generate(articles.length, (int index) {
                  return buildArticle(context, articles[index]);
                }));

          default:
            return Center(
              child: Text("Error Loading data"),
            );
        }
      },
    );
  }
}
