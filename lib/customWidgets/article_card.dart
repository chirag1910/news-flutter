import 'package:flutter/material.dart';
import 'package:news/models/articles.dart';
import 'package:news/pages/article_page.dart';

Widget articleCardWidget(BuildContext context, Article article) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyArticlePage(article: article)));
    },
    child: Column(
      children: [
        Hero(
          tag: article.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              article.imageUrl ??
                  "https://s4.anilist.co/file/anilistcdn/character/medium/default.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            article.title ?? "Title",
            style: Theme.of(context).textTheme.headline2,
          ),
        )
      ],
    ),
  );
}
