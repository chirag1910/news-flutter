import 'package:flutter/material.dart';
import 'package:news/styles/themes.dart';
import 'package:news/utils/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: CustomTheme.lightTheme(context),
      darkTheme: CustomTheme.darkTheme(context),
      routes: CustomRoute.routeMap,
      initialRoute: CustomRoute.splashPage,
    );
  }
}
