import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_state.dart';
import 'package:edirne_gezgini_ui/bloc/hotels_bloc/hotels_status.dart';
import 'package:edirne_gezgini_ui/model/dto/accommodation_dto.dart';
import 'package:edirne_gezgini_ui/view/place_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/hotels_bloc/hotels_event.dart';
import '../widget/place_card.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HotelsBloc>().add(GetHotelList());
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
              "Oteller",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: BlocBuilder<HotelsBloc, HotelsState>(builder: (context, state) {
          if (state.hotelListStatus is GetHotelListPending ||
              state.hotelListStatus is InitialHotelListStatus) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.hotelListStatus is GetHotelListSuccess) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //list hotels
                SizedBox(
                  width: width * 100,
                  height: height * 65,
                  child: hotelsListView(state.hotelList, width * 1, height * 1),
                )
              ],
            );
          } else {
            return Center(
                child: Text(
                    (state.hotelListStatus as GetHotelListFailed).message));
          }
        }));
  }

  Widget hotelsListView(
      List<AccommodationDto> hotels, double width, double height) {
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: hotels.length,
        itemBuilder: (BuildContext context, int index) {
          var currentHotel = hotels[index];

          return GestureDetector(
            child: PlaceCard(
              title: currentHotel.title,
              image: currentHotel.image,
              width: width,
              height: height,
              isVisited: false,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetailsPage(
                          title: currentHotel.title,
                          info: currentHotel.info,
                          location: currentHotel.location,
                          image: currentHotel.image)));
            },
          );
        });
  }
}
