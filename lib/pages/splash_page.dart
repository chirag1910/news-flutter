import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/utils/routes.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({Key? key}) : super(key: key);

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  void initState() {
    super.initState();
    checkNetworkConnection();
  }

  Future<void> checkNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        changePage();
      } else {
        showSnackBar();
      }
    } catch (_) {
      showSnackBar();
    }
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("No Internet Connection!"),
      action: SnackBarAction(label: "Retry", onPressed: checkNetworkConnection),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      duration: const Duration(days: 366),
    ));
  }

  void changePage() {
    Navigator.pushReplacementNamed(context, CustomRoute.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1b1a1d),
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width / 2.2,
          height: MediaQuery.of(context).size.height / 2.2,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
