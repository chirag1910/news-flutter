import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/articles.dart';

class MyArticlePage extends StatelessWidget {
  const MyArticlePage({super.key, required this.article});

  final Article article;

  void shareArticle() {
    Share.share(article.link ?? "");
  }

  void openWebsite(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        actions: [
          (article.link != null
              ? IconButton(
                  onPressed: shareArticle,
                  icon: const Icon(Icons.share_rounded))
              : const SizedBox()),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
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
          (article.pubDate != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      article.pubDate != null ? DateTime.parse(article.pubDate!).toLocal().toString() : "Publish Date Unknown",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.right,
                    ),
                  ],
                )
              : const SizedBox()),
          const SizedBox(
            height: 15,
          ),
          Text(
            article.title ?? "Title",
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 15,
          ),
          (article.description != null
              ? Text(
                  article.description ?? "Description",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              : const SizedBox()),
          const SizedBox(
            height: 15,
          ),
          (article.content != null
              ? Text(
                  article.content ?? "Content",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              : const SizedBox()),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: article.url != null
          ? FloatingActionButton.extended(
              onPressed: () {
                openWebsite(article.url ?? "");
              },
              label: const Text('Source'),
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            )
          : const SizedBox(),
    );
  }
}
