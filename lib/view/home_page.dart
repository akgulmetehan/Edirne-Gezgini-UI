import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/historical_list_status.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_event.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_navigator_cubit.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/home_state.dart';
import 'package:edirne_gezgini_ui/bloc/home_bloc/museum_list_status.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_event.dart';
import 'package:edirne_gezgini_ui/model/base_place.dart';
import 'package:edirne_gezgini_ui/model/dto/place_dto.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/model/enum/place_category.dart';
import 'package:edirne_gezgini_ui/service/place_service.dart';
import 'package:edirne_gezgini_ui/service/user_service.dart';
import 'package:edirne_gezgini_ui/view/account_page.dart';
import 'package:edirne_gezgini_ui/view/place_details_page.dart';
import 'package:flutter/material.dart';

import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../bloc/restaurants_bloc/restaurants_bloc.dart';
import '../bloc/restaurants_bloc/restaurants_event.dart';
import '../widget/hero_area.dart';
import '../widget/place_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(GetMuseumList());
      context.read<HomeBloc>().add(GetHistoricalList());
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: PopupMenuButton<String>(
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              restaurantsPopupMenuItem(context),
              hotelsPopupMenuItem(context)
            ],
            icon: const Icon(Icons.menu),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    image: const DecorationImage(
                      image: AssetImage("images/profil.jpg"),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AccountPage()));
              },
            )
          ],
          title: const Center(
              child: AutoSizeText(
            "EDİRNE GEZGİNİ",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: constants.primaryTextColor),
          )),
          scrolledUnderElevation: 0.0,
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          const HeroArea(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              "Tarihi Mekanlar",
              textAlign: TextAlign.left,
              minFontSize: 15,
              style: TextStyle(
                color: constants.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),
          //list historical places
          SizedBox(
            width: width * 100,
            height: height * 65,
            child: historicalPlaces(width * 0.5, height * 1),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              "Müzeler",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: constants.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          const SizedBox(height: 16),
          //list museums
          SizedBox(
              width: width * 50,
              height: height * 65,
              child: museums(width * 0.5, height * 1)),
        ]));
  }

  Widget historicalPlaces(double width, double height) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      const category = PlaceCategory.historical;
      String message;
      HistoricalListStatus historicalListStatus = state.historicalListStatus;

      if (historicalListStatus is GetHistoricalListFailed) {
        message = historicalListStatus.message;
        return Text(message);
      }

      if (historicalListStatus is GetHistoricalListPending ||
          historicalListStatus is InitialHistoricalListStatus) {
        return const CircularProgressIndicator();
      } else {
        List<PlaceDto> historicalList = state.placeList[category]!;
        return historicalPlacesListView(historicalList, width, height);
      }
    });
  }

  Widget museums(double width, double height) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      const category = PlaceCategory.museum;
      MuseumListStatus museumListStatus = state.museumListStatus;

      if (museumListStatus is GetMuseumListPending ||
          museumListStatus is InitialMuseumListStatus) {
        return const CircularProgressIndicator();
      }

      if (museumListStatus is GetMuseumListFailed) {
        final status = state.museumListStatus as GetMuseumListFailed;
        return Text(status.message);
      }

      List<PlaceDto> museumList = state.placeList[category]!;
      return museumsListView(museumList, width, height);
    });
  }

  Widget historicalPlacesListView(
      List<PlaceDto> historicalPlaceList, double width, double height) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: historicalPlaceList.length,
      itemBuilder: (BuildContext context, int index) {
        PlaceDto currentHistoricalPlace = historicalPlaceList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: PlaceCard(
              title: currentHistoricalPlace.title,
              image: currentHistoricalPlace.image!,
              //currentHistoricalPlace.image,
              width: width,
              height: height,
              isVisited: false,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetailsPage(
                            title: currentHistoricalPlace.title,
                            info: currentHistoricalPlace.info,
                            location: currentHistoricalPlace.location,
                            image: currentHistoricalPlace.image!,
                          )));
            },
          ),
        );
      },
    );
  }

  Widget museumsListView(
      List<PlaceDto> museumList, double width, double height) {
    PlaceCategory category = PlaceCategory.museum;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      itemCount: museumList.length,
      itemBuilder: (BuildContext context, int index) {
        PlaceDto currentMuseum = museumList[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: PlaceCard(
              title: currentMuseum.title,
              image: currentMuseum.image!,
              width: width,
              height: height,
              isVisited: false,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetailsPage(
                            title: currentMuseum.title,
                            info: currentMuseum.info,
                            location: currentMuseum.location,
                            image: currentMuseum.image!,
                          )));
            },
          ),
        );
      },
    );
  }

  PopupMenuItem<String> restaurantsPopupMenuItem(BuildContext context) {
    return PopupMenuItem<String>(
      value: 'Restoranlar',
      child: const Text(
        'Restoranlar',
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        context.read<HomeNavigatorCubit>().showRestaurants();
        int tapCount = context.read<HomeNavigatorCubit>().tapCount1;
        context.read<HomeNavigatorCubit>().tapCount1 = tapCount + 1;
        if (tapCount == 1 || tapCount / 3 == 1) {
          BlocProvider.of<RestaurantsBloc>(context).add(GetRestaurantList());
        }
      },
    );
  }

  PopupMenuItem<String> hotelsPopupMenuItem(BuildContext context) {
    return PopupMenuItem<String>(
        value: 'Oteller',
        child: const Text(
          'Oteller',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          context.read<HomeNavigatorCubit>().showHotels();
          int tapCount = context.read<HomeNavigatorCubit>().tapCount2;
          context.read<HomeNavigatorCubit>().tapCount2 = tapCount + 1;
          if (tapCount == 1 || tapCount / 3 == 1) {
            BlocProvider.of<HotelsBloc>(context).add(GetHotelList());
          }
        });
  }
}
