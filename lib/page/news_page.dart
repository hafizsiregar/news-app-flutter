import 'package:flutter/material.dart';
import 'package:news_app_dicoding/models/data_news.dart';

import 'detail_news.dart';

class NewsListPage extends StatelessWidget {

  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('asset/articles.json'),
        builder: (context, snapshot) {
          final List<DataJson> dataJson = dataJsonFromJson(snapshot.data);
          return ListView.builder(
            itemCount: dataJson.length,
            itemBuilder: (context, index) {
              return _buildArticleItem(context, dataJson[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, DataJson article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailPage.routeName,
            arguments: article);
      },
    );
  }
}