import 'package:flutter/material.dart';
import 'package:news/customWidgets/articles_container.dart';
import 'package:news/customWidgets/empty_articles.dart';
import 'package:news/utils/api.dart';
import 'package:news/utils/key_generator.dart';
import 'package:news/utils/routes.dart';

import '../customWidgets/bottom_nav_bar.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  String _keyword = "";
  String _stateKey = getRandomString(10);

  void searchArticles(String str) {
    setState(() {
      _keyword = str;
      _stateKey = getRandomString(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Search"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CustomRoute.locationPage);
              },
              icon: const Icon(Icons.settings))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? const Color(0x0C000000)
                    : const Color(0x0fffffff),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search here...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search_rounded),
                ),
                textInputAction: TextInputAction.go,
                onSubmitted: searchArticles,
                autofocus: true,
              ),
            ),
          ),
        ),
      ),
      body: _keyword.isNotEmpty
          ? ArticlesContainer(
              apiFunction: ({int page = 1}) =>
                  Api.search(query: _keyword, page: page),
              stateKey: _stateKey,
            )
          : Center(child: emptyListView(context, msg: "Keyword required!")),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}
