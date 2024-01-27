import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/restaurant.dart';
import 'package:edirne_gezgini_ui/view/place_details_page.dart';
import 'package:flutter/material.dart';


import '../database/temporary_database.dart';
import '../widget/place_card.dart';


class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = TemporaryDatabase().restaurants;
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Restoranlar",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            //list restaurants
            SizedBox(
                width: width * 100,
                height: height * 80,
                child: restaurantsListView(restaurants, width, height)
            )
          ],
        ));
  }

  Widget restaurantsListView(List<Restaurant> restaurant, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: restaurant.length,
        itemBuilder: (BuildContext context, int index) {
          var currentRestaurant = restaurant[index];

          return GestureDetector(
            child:
            PlaceCard(
                title: currentRestaurant.title,
                image: currentRestaurant.image,
                width: width,
                height: height,
                isVisited: false,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PlaceDetailsPage(place: currentRestaurant, category: BasePlaceCategory.restaurant,)));
            },
          );
        });
  }
}