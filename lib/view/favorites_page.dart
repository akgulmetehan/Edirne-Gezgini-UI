import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/widget/place_card.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;

import '../model/favorite.dart';
import '../model/place.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Favorite> favoritePlaces = TemporaryDatabase()
      .favorites
      .where((favorite) => favorite.category == BasePlaceCategory.place)
      .toList();
  List<Favorite> favoriteAccommodations = TemporaryDatabase()
      .favorites
      .where((favorite) => favorite.category == BasePlaceCategory.accommodation)
      .toList();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "favorilerim",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Favori mekanlarım",
              style: TextStyle(
                  fontSize: 24,
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 16,
          ),
          //list places
          SizedBox(
            width: width * 100,
            height: height * 65,
            child: favoritePlacesListView(favoritePlaces, width*0.5, height*1),
          ),

          const Padding(
            padding: EdgeInsets.all(8),
            child: AutoSizeText(
              "Favori konaklama yerlerim",
              style: TextStyle(
                  fontSize: 24,
                  color: constants.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 16),

          //list accommodations
          SizedBox(
            width: width * 100,
            height: height * 65,
            child: favoriteAccommodationsListView(favoriteAccommodations, width*0.5, height*1),
          ),
        ],
      ),
    );
  }

  Widget favoritePlacesListView(List<Favorite> favoritePlaces, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: favoritePlaces.length,
        itemBuilder: (BuildContext context, int index) {

          Place currentPlace = favoritePlaces[index].favoritePlace as Place;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                PlaceCard(
                    title: currentPlace.title,
                    image: currentPlace.image,
                    width: width,
                    height: height,
                    isVisited: false,
                ),
          );
        });
  }

  Widget favoriteAccommodationsListView(List<Favorite> favoriteAccommodations, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: favoriteAccommodations.length,
        itemBuilder: (BuildContext context, int index) {

          Accommodation currentAccommodation =
              favoriteAccommodations[index].favoritePlace as Accommodation;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(
                title: currentAccommodation.title,
                image: currentAccommodation.image,
                width: width,
                height: height,
                isVisited: false,
            ),
          );
        });
  }
}
