import 'package:edirne_gezgini_ui/database/temporary_database.dart';
import 'package:edirne_gezgini_ui/model/accommodation.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:flutter/material.dart';

import '../model/place.dart';

class PlaceCard extends StatelessWidget {
  final String title;

  final String image;

  final double width;

  final double height;

  final bool isVisited;

  const PlaceCard(
      {super.key,
      required this.title,
      required this.image,
      required this.width,
      required this.height,
      required this.isVisited});

  @override
  Widget build(BuildContext context) {
    List<Place> favoritePlaces = TemporaryDatabase()
        .favorites
        .where((favorite) => favorite.category == BasePlaceCategory.place)
        .map((favorite) => favorite.favoritePlace as Place)
        .toList();

    List<Accommodation> favoriteAccommodations = TemporaryDatabase()
        .favorites
        .where(
            (favorite) => favorite.category == BasePlaceCategory.accommodation)
        .map((favorite) => favorite.favoritePlace as Accommodation)
        .toList();
    return SizedBox(
      width: width * 100,
      height: height * 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  height: height * 45,
                  width: width * 100,
                  fit: BoxFit.cover,
                ),
              ),
              isVisited == true
                  ? noteWidget()
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 75,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(84, 84, 84, 1)),
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                ),
              ),
              favoriteButton(favoritePlaces, favoriteAccommodations, title)
            ],
          ),
        ],
      ),
    );
  }

  Widget favoriteButton(List<Place> favoritePlaces,
      List<Accommodation> favoriteAccommodations, String currentTitle) {
    bool isFavoritesEmpty =
        favoritePlaces.where((place) => place.title == currentTitle).isEmpty &&
            favoriteAccommodations
                .where((accommodation) => accommodation.title == currentTitle)
                .isEmpty;

    return isFavoritesEmpty == true
        ? IconButton(
            onPressed: () => {
              /* add this as favorite to dataBase later */
            },
            icon: const Icon(Icons.favorite_border),
            splashRadius: 0.1,
          )
        : IconButton(
            onPressed: () => {
              /* add this as favorite to dataBase later */
            },
            icon: const Icon(Icons.favorite),
            splashRadius: 0.1,
          );
  }

  Widget noteWidget() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      child: IconButton(
        icon: const Icon(Icons.note_rounded),
        color: constants.bottomNavBarColor,
        iconSize: width * 13,
        onPressed: () {},
      ),
    );
  }
}
