import 'package:flutter/material.dart';
import 'package:news/customWidgets/articles_container.dart';
import 'package:news/utils/api.dart';
import 'package:news/utils/globals.dart';
import 'package:news/utils/routes.dart';
import 'package:news/utils/settings.dart';

import '../customWidgets/bottom_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> categories = [
    "business",
    "entertainment",
    "environment",
    "food",
    "health",
    "politics",
    "science",
    "sports",
    "technology",
    "top",
    "world",
  ];

  bool _prefLoaded = false;

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  void getPreferences() async {
    SettingsGlobals.countryCode = await Settings.getCountryCode();
    SettingsGlobals.language = await Settings.getLanguage();
    setState(() {
      _prefLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          title: const Text("Headlines"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CustomRoute.locationPage);
                },
                icon: const Icon(Icons.settings))
          ],
          bottom: TabBar(
              isScrollable: true,
              tabs: categories.map((c) {
                return Text(c.toUpperCase());
              }).toList()),
        ),
        body: TabBarView(
          children: categories.map((c) {
            return _prefLoaded
                ? ArticlesContainer(
                    apiFunction: ({int page = 1}) => Api.getPersonalized(
                      category: c,
                      countryCode: SettingsGlobals.countryCode ?? "in",
                      language: SettingsGlobals.language ?? "en",
                      page: page,
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          }).toList(),
        ),
        bottomNavigationBar: const CustomBottomNavBar(
          selectedIndex: 0,
        ),
      ),
    );
  }
}
