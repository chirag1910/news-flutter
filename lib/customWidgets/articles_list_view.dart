import 'package:flutter/material.dart';
import 'package:news/customWidgets/article_card.dart';

import '../models/articles.dart';

class ArticlesListView extends StatefulWidget {
  ArticlesListView(
      {Key? key,
      required this.articles,
      required this.loadMore,
      this.page = 1,
      this.end = false})
      : super(key: key);

  final List<Article> articles;
  final Function loadMore;
  int page;
  bool end;

  @override
  State<StatefulWidget> createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesListView> {
  bool _isLoading = false;
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(listen);
  }

  @override
  void dispose() {
    controller.removeListener(listen);
    controller.dispose();
    super.dispose();
  }

  void listen() {
    final diff = controller.position.maxScrollExtent - controller.offset;

    if (diff < 400 && !widget.end && !_isLoading) {
      _loadMore();
    }
  }

  void _loadMore() async {
    setState(() {
      _isLoading = true;
    });

    final Articles response = await widget.loadMore(page: widget.page + 1);

    if (response.articles != null) {
      if (response.articles!.isNotEmpty) {
        widget.articles.addAll(response.articles!);
      } else {
        widget.end = true;
      }
      widget.page++;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.articles.length * 2 + 1,
        controller: controller,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, position) {
          if (position.isOdd) {
            return const Divider(
              thickness: 0.5,
              height: 30,
            );
          }

          final index = position ~/ 2;

          if (index < widget.articles.length) {
            return articleCardWidget(context, widget.articles[index]);
          } else {
            if (_isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const SizedBox();
            }
          }
        });
  }
}
