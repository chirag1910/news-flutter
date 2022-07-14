import 'package:flutter/material.dart';
import 'package:news/pages/search_page.dart';
import 'package:news/pages/settings_page.dart';
import 'package:news/pages/home_page.dart';
import 'package:news/pages/splash_page.dart';

class CustomRoute {
  static String locationPage = "/location";
  static String homePage = "/home";
  static String articlePage = "/article";
  static String splashPage = "/";
  static String searchPage = "/search";

  static Map<String, Widget Function(BuildContext)> routeMap = {
    locationPage: (context) => const MySettingsPage(),
    homePage: (context) => const MyHomePage(),
    splashPage: (context) => const MySplashPage(),
    searchPage: (context) => const MySearchPage(),
  };
}
