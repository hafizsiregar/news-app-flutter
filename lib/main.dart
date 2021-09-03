import 'package:flutter/material.dart';
import 'package:news_app_dicoding/page/news_page.dart';
import 'models/data_news.dart';
import 'page/detail_news.dart';

void main() {  
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
  NewsListPage.routeName: (context) => NewsListPage(),
  ArticleDetailPage.routeName: (context) => ArticleDetailPage(
        dataJson: ModalRoute.of(context)?.settings.arguments as DataJson,
      ),
  ArticleWebView.routeName: (context) => ArticleWebView(
        url: ModalRoute.of(context)?.settings.arguments as String,
      ),
},
    );
  }
}