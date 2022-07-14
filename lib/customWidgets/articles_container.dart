import 'package:flutter/material.dart';

import '../models/articles.dart';
import 'articles_list_view.dart';
import 'empty_articles.dart';

class ArticlesContainer extends StatefulWidget {
  const ArticlesContainer({Key? key, required this.apiFunction, this.stateKey})
      : super(key: key);

  final Function apiFunction;
  final String? stateKey;

  @override
  State<StatefulWidget> createState() => _ArticlesContainerState();
}

class _ArticlesContainerState extends State<ArticlesContainer>
    with AutomaticKeepAliveClientMixin<ArticlesContainer> {
  Articles? articles;
  bool _isLoaded = false;
  bool end = false;
  int page = 1;

  @override
  void initState() {
    super.initState();
    run();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didUpdateWidget(ArticlesContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.stateKey != oldWidget.stateKey) {
      setState(() {
        _isLoaded = false;
      });
      refresh();
    }
  }

  void run() async {
    articles = await widget.apiFunction();
    setState(() {
      _isLoaded = true;
    });
  }

  Future<void> refresh() async {
    final Articles response = await widget.apiFunction(page: 1);

    if (response.articles != null) {
      if (response.articles!.isNotEmpty) {
        setState(() {
          articles = response;
          _isLoaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: _isLoaded
          ? ((articles != null &&
                  articles?.articles != null &&
                  articles!.articles!.isNotEmpty)
              ? RefreshIndicator(
                  onRefresh: refresh,
                  child: ArticlesListView(
                    articles: articles?.articles ?? [],
                    loadMore: widget.apiFunction,
                    page: page,
                    end: end,
                  ),
                )
              : RefreshIndicator(
                  onRefresh: refresh, child: emptyListView(context)))
          : const CircularProgressIndicator(),
    );
  }
}
