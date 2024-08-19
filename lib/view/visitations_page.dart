import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_bloc.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_event.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_state.dart';
import 'package:edirne_gezgini_ui/bloc/visitations_bloc/visitations_status.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:edirne_gezgini_ui/widget/place_card.dart';
import 'package:flutter/material.dart';
import 'package:edirne_gezgini_ui/constants.dart' as constants;
import 'package:flutter_bloc/flutter_bloc.dart';
class VisitationsPage extends StatefulWidget {
  const VisitationsPage({super.key});

  @override
  State<StatefulWidget> createState() => _VisitationsPageState();
}

class _VisitationsPageState extends State<VisitationsPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VisitationsBloc>().add(GetVisitationList());
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
          "Gittiğim Yerler",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<VisitationsBloc, VisitationsState>(
        builder: (context, state) {
          if (state.visitationsStatus is GetVisitationListPending || state.visitationsStatus is InitialVisitationStatus) {
            return const Center(child: CircularProgressIndicator());

          } else if (state.visitationsStatus is GetVisitationListSuccess) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                buildSectionTitle("Gittiğim Mekanlar"),
                const SizedBox(height: 16),
                SizedBox(width: width*100, height: height*65, child: buildVisitationListView(state, BasePlaceCategory.place, width*0.5, height*1)),
                buildSectionTitle("Gittiğim Konaklama Yerleri"),
                const SizedBox(height: 16),
                SizedBox(width: width*100, height: height*65, child: buildVisitationListView(state, BasePlaceCategory.accommodation, width*0.5, height*1)),
                buildSectionTitle("Gittiğim Restoranlar"),
                const SizedBox(height: 16),
                SizedBox(width: width*100, height: height*65, child: buildVisitationListView(state, BasePlaceCategory.restaurant ,width*0.5, height*1)),
              ],
            );

          } else{
            return Center(child: Text((state.visitationsStatus as GetVisitationListFailed).message));
          }
        },
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

  Widget buildVisitationListView(VisitationsState state, BasePlaceCategory category, double width, double height) {
    final visitations = state.visitationList[category]!;
    String title = "";
    String image = "";
    String note = "";
    if (visitations.isEmpty) {
      return const Center(child: Text("Ziyaret edilen yer yok."));
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: visitations.length,
        itemBuilder: (context, index) {
          var visitation = visitations[index]!;
          var visitedPlaceId = visitation.visitedPlaceId;
          note = visitation.note!;

          switch(category) {
            case BasePlaceCategory.accommodation:
              if(state.accommodationList.isEmpty) {
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
              image = place.image!;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceCard(
              title: title,
              image: image,
              width: width,
              height: height,
              isVisited: true,
            )
          );
        },
      ),
    );
  }
}