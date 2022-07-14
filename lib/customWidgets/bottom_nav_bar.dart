import 'package:flutter/material.dart';
import 'package:news/utils/routes.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    this.selectedIndex = 1,
  }) : super(key: key);

  final int selectedIndex;

  void handleOnTap(BuildContext context, int index) {
    if (index != selectedIndex) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, CustomRoute.homePage);
          break;
        case 1:
          Navigator.pushNamed(context, CustomRoute.searchPage);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.newspaper_rounded),
          label: 'HOME',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_rounded),
          label: 'SEARCH',
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) {
        handleOnTap(context, index);
      },
    );
  }
}
