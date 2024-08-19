import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_state.dart';
import 'package:edirne_gezgini_ui/bloc/restaurants_bloc/restaurants_status.dart';
import 'package:edirne_gezgini_ui/model/dto/restaurant_dto.dart';
import 'package:edirne_gezgini_ui/view/place_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/restaurants_bloc/restaurants_event.dart';
import '../widget/place_card.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<StatefulWidget> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantsBloc>().add(GetRestaurantList());
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Restoranlar",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state) {
          if (state.restaurantListStatus is GetRestaurantListPending ||
              state.restaurantListStatus is InitialRestaurantListStatus) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.restaurantListStatus is GetRestaurantListSuccess) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //list restaurants
                SizedBox(
                    width: width * 100,
                    height: height * 80,
                    child: restaurantsListView(
                        state.restaurantList, width, height))
              ],
            );
          } else {
            return Center(
                child: Text(
                    (state.restaurantListStatus as GetRestaurantListFailed)
                        .message));
          }
        }));
  }

  Widget restaurantsListView(
      List<RestaurantDto?> restaurantList, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: restaurantList.length,
        itemBuilder: (BuildContext context, int index) {
          var currentRestaurant = restaurantList[index];

          return GestureDetector(
            child: PlaceCard(
              title: currentRestaurant!.title,
              image: currentRestaurant.image,
              width: width,
              height: height,
              isVisited: false,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetailsPage(
                          title: currentRestaurant.title,
                          info: currentRestaurant.info,
                          location: currentRestaurant.location,
                          image: currentRestaurant.image)));
            },
          );
        });
  }
}
