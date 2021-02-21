import 'package:flutter/material.dart';
import 'package:fudeo_test_ansa/pages/article_detail.dart';
import 'package:fudeo_test_ansa/provider/api.dart';
import 'package:fudeo_test_ansa/models/article.dart';

class LastHourPage extends StatelessWidget {
  Widget buildHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notizie dell\'ultima ora',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Top 10 notizie qui per te',
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
        Expanded(
          child: Container(),
        ),
        Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.yellow,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '18 Feb',
              style: TextStyle(color: Colors.black45),
            ),
          ],
        )
      ],
    );
  }

  Widget buildHeadline(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article),
            ));
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12)),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'NOTIZIE DI PUNTA',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            article.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            article.content,
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

  Widget buildArticles(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article),
            ));
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  article.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  article.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topHeadlines(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            List<Article> articles = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 1 + articles.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildHeader();
                } else if (index == 1) {
                  return Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: buildHeadline(context, articles[index - 1]),
                  );
                } else
                  return Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: buildArticles(context, articles[index - 1]));
              },
            );

          default:
            return Center(
              child: Text("Error Loading data"),
            );
        }
      },
    );
  }
}
