import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xfffefbff),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Color(0xffdee5f2), // 100
          backgroundColor: Color(0xffdee5f2), // 100
          titleTextStyle: TextStyle(
            fontFamily: "BlackOpsOne",
            fontSize: 30,
            color: Color(0xff1b1a1c), // 900
          ),
          actionsIconTheme: IconThemeData(
            color: Color(0xff1b1a1c), // 900
          ),
        ),
        tabBarTheme: const TabBarTheme(
            labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.w900),
            labelColor: Color(0xff111c30), // 900
            unselectedLabelColor: Color(0xffafb4b3), // 300
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              color: Color(0xff111c30), // 900
              width: 1.5,
            ))),
        dividerColor: const Color(0x661a5ea5), // 500
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color(0xffdee5f2),
            elevation: 0,
            indicatorColor: const Color(0xff3771df),
            iconTheme: MaterialStateProperty.all(const IconThemeData(
              color: Color(0xff1b1a1c),
            )),
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff111c30),
              ),
            )),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xff3771df), // 500
        ),
        textTheme: const TextTheme(
            headline1: TextStyle(
                color: Color(0xff111c30), // 900
                fontSize: 28,
                fontWeight: FontWeight.w800),
            headline2: TextStyle(
              color: Color(0xff061a41), // 900
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodyText1: TextStyle(
              color: Color(0xff0f2d67), // 800
              wordSpacing: 2,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            labelMedium: TextStyle(
              color: Color(0xff414651), // 300
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
            subtitle1: TextStyle(
              color: Color(0xff414651), // 300
              fontWeight: FontWeight.w700,
            )),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff1b1a1d),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Color(0xff262931), // 100
          backgroundColor: Color(0xff262931), // 100
          titleTextStyle: TextStyle(
            fontFamily: "BlackOpsOne",
            fontSize: 30,
            color: Color(0xffe7e6e9), // 900
          ),
          actionsIconTheme: IconThemeData(
            color: Color(0xffe7e6e9), // 900
          ),
        ),
        tabBarTheme: const TabBarTheme(
            labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            labelStyle: TextStyle(fontWeight: FontWeight.w900),
            labelColor: Color(0xffe2e2e4), // 900
            unselectedLabelColor: Color(0xffafb4b3), // 300
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              color: Color(0xffe2e2e4), // 900
              width: 1.5,
            ))),
        dividerColor: const Color(0x661a5ea5), // 500
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color(0xff262931),
            elevation: 0,
            indicatorColor: const Color(0xff3771df),
            iconTheme: MaterialStateProperty.all(const IconThemeData(
              color: Color(0xffe7e6e9),
            )),
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xffe2e2e4),
              ),
            )),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xff3771df), // 500
        ),
        textTheme: const TextTheme(
            headline1: TextStyle(
                color: Color(0xfffefeff), // 900
                fontSize: 28,
                fontWeight: FontWeight.w800),
            headline2: TextStyle(
              color: Color(0xfffefeff), // 900
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            bodyText1: TextStyle(
              color: Color(0xffe2e2e4), // 800
              wordSpacing: 2,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            labelMedium: TextStyle(
              color: Color(0xffa2a4a9), // 300
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
            subtitle1: TextStyle(
              color: Color(0xffa2a4a9), // 300
              fontWeight: FontWeight.w700,
            )),
      );
}
