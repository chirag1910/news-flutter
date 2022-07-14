import 'package:flutter/material.dart';

Widget emptyListView(BuildContext context, {String msg = "No News To Show!"}) {
  return SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child: SizedBox(
      height: MediaQuery.of(context).size.height - 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no_news.webp",
            width: MediaQuery.of(context).size.width / 3,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            msg,
            style: Theme.of(context).textTheme.labelMedium,
          )
        ],
      ),
    ),
  );
}
