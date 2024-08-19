import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_event.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_state.dart';
import 'package:edirne_gezgini_ui/bloc/favorites_bloc/favorites_status.dart';
import 'package:edirne_gezgini_ui/widget/place_card.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorites_bloc/favorites_bloc.dart';
import '../model/enum/base_place_category.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesBloc>().add(GetFavoriteList());
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "Favorilerim",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context,state) {
          if(state.favoritesStatus is GetFavoriteListPending || state.favoritesStatus is InitialFavoritesStatus) {
            return const Center(child: CircularProgressIndicator());
          } else if(state.favoritesStatus is GetFavoriteListSuccess) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                buildSectionTitle("Favori Mekanlarım"),
                const SizedBox(height: 16),
                SizedBox(width: width*100, height: height*65,child: buildFavoriteListView(state, BasePlaceCategory.place, width*0.5, height*1),),
                buildSectionTitle("Favori Konaklama Yerlerim"),
                const SizedBox(height: 16),
                SizedBox(width: width*100, height: height*65, child: buildFavoriteListView(state, BasePlaceCategory.accommodation, width*0.5, height*1)),
                const SizedBox(height: 16),
                buildSectionTitle("Favori Restaurantlarım"),
                SizedBox(width: width*100, height: height*65, child: buildFavoriteListView(state, BasePlaceCategory.restaurant, width*0.5, height*1))
              ],
            );
          } else {
            return Center(child: Text((state.favoritesStatus as GetFavoriteListFailed).message));
          }
        }
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AutoSizeText(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: constants.primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildFavoriteListView(FavoritesState state, BasePlaceCategory category, double width, double height) {
    final favorites = state.favoriteList[category];
    int? length = favorites?.length;
    if (favorites == null || favorites.isEmpty) {
      return const Center(child: Text("favorilediğin bir yer yok."));
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length,
        itemBuilder: (context, index) {
          var visitation = favorites[index]!;
          var visitedPlaceId = visitation.favoritePlaceId;
          String title = "";
          String? image = "";

          switch(category) {
            case BasePlaceCategory.accommodation:
              if(state.accommodationList.isEmpty){
                break;
              }
              final accommodation = state.accommodationList[visitedPlaceId]!;
              title = accommodation.title;
              image = accommodation.image;

            case BasePlaceCategory.restaurant:
              if(state.restaurantList.isEmpty) {
                break;
              }
              final restaurant = state.restaurantList[visitedPlaceId]!;
              title = restaurant.title;
              image = restaurant.image;

            case BasePlaceCategory.place:
              if(state.placeList.isEmpty) {
                break;
              }
              final place = state.placeList[visitedPlaceId]!;
              title = place.title;
              image = place.image;
          }

          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlaceCard(
                title: title,
                image: image!,
                width: width,
                height: height,
                isVisited: false,
              )
          );
        },
      ),
    );
  }
}
