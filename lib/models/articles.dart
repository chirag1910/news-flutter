import 'package:news/utils/key_generator.dart';

class Articles {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Articles({this.status, this.totalResults, this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) {
    // return Articles(
    //   status: json["status"],
    //   totalResults: json["totalResults"],
    //   articles: json["status"] != "error" ? (json["results"] as List)
    //       .map<Article>((a) => Article.fromJson(a))
    //       .toList() : [],
    // );

    return Articles(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["status"] != "error"
          ? (json["articles"] as List)
              .map<Article>((a) => Article.fromJson(a))
              .toList()
          : [],
    );
  }
}

class Article {
  String id;
  String? title;
  String? description;
  String? content;
  String? url;
  String? imageUrl;
  String? pubDate;
  String? link;

  Article(
      {required this.id,
      this.title,
      this.description,
      this.content,
      this.url,
      this.imageUrl,
      this.pubDate,
      this.link});

  factory Article.fromJson(Map<String, dynamic> json) {
    // return Article(
    //   id: getRandomString(16),
    //   title: json["title"],
    //   description: json["description"],
    //   content: json["content"],
    //   imageUrl: json["image_url"],
    //   pubDate: json["pubDate"],
    //   link: json["link"],
    // );

    return Article(
      id: getRandomString(16),
      title: json["title"],
      description: json["description"],
      content: json["content"],
      url: json["url"],
      imageUrl: json["urlToImage"],
      pubDate: json["publishedAt"],
      link: json["url"],
    );
  }
}
