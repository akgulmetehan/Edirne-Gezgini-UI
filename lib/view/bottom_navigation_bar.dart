import 'package:edirne_gezgini_ui/view/favorites_page.dart';
import 'package:edirne_gezgini_ui/view/get_route_page.dart';
import 'package:edirne_gezgini_ui/view/home_page.dart';
import 'package:edirne_gezgini_ui/view/visited_places_page.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: const [
              HomePage(),
              FavoritePage(),
              VisitedPlacesPage(),
              GetRoutePage()
            ],
          ),
          bottomNavigationBar: NavigationBar(
            destinations: [home(), favorites(), visit(), getRoute()],
            indicatorColor: constants.bottomNavBarColor.withOpacity(0.9),
            selectedIndex: currentIndex,
            elevation: 0,
            onDestinationSelected: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          )),
    );
  }
}

NavigationDestination home() {
  return const NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: "Ana Sayfa");
}

NavigationDestination favorites() {
  return const NavigationDestination(
      selectedIcon: Icon(Icons.favorite),
      icon: Icon(Icons.favorite_border),
      label: "Favorilerim");
}

NavigationDestination visit() {
  return const NavigationDestination(
      selectedIcon: Icon(Icons.location_on_outlined),
      icon: Icon(Icons.location_on_outlined),
      label: "Gittiğim Yerler");
}

NavigationDestination getRoute() {
  return const NavigationDestination(
    selectedIcon: Icon(Icons.map),
    icon: Icon(Icons.map_outlined),
    label: "Rota Göster",
  );
}