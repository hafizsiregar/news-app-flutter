import 'dart:convert';

List<DataJson> dataJsonFromJson(String? str) => List<DataJson>.from(json.decode(str!).map((x) => DataJson.fromJson(x)));

String dataJsonToJson(List<DataJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataJson {
    DataJson({
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    late String author;
    late String title;
    late String description;
    late String url;
    late String urlToImage;
    late DateTime publishedAt;
    late String content;

    factory DataJson.fromJson(Map<String, dynamic> json) => DataJson(
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}


// class Article {
//   late String author;
//   late String title;
//   late String description;
//   late String url;
//   late String urlToImage;
//   late String publishedAt;
//   late String content;
 
//   Article({
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//   });

//   Article.fromJson(Map<String, dynamic> article) {
//     author = article['author'];
//     title = article['title'];
//     description = article['description'];
//     url = article['url'];
//     urlToImage = article['urlToImage'];
//     publishedAt = article['publishedAt'];
//     content = article['content'];
//   }

//   List<Article> parseArticle(String? json) {
//     if (json == null) {
//       return [];
//     }
  
//     final List parsed = jsonDecode(json);
//     return parsed.map((json) => Article.fromJson(json)).toList();
//   }
// }