import 'package:flutter/material.dart';
import 'package:news_app_dicoding/models/data_news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final DataJson dataJson;

  const ArticleDetailPage({required this.dataJson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataJson.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(dataJson.urlToImage),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataJson.description),
                  Divider(color: Colors.grey),
                  Text(
                    dataJson.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Text('Date: ${dataJson.publishedAt}'),
                  SizedBox(height: 10),
                  Text('Author: ${dataJson.author}'),
                  Divider(color: Colors.grey),
                  Text(
                    dataJson.content,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('Read more'),
                    onPressed: () {
                      Navigator.pushNamed(context, ArticleWebView.routeName,
                          arguments: dataJson.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}