import 'package:auto_size_text/auto_size_text.dart';
import 'package:edirne_gezgini_ui/model/base_place.dart';
import 'package:edirne_gezgini_ui/model/enum/base_place_category.dart';
import 'package:flutter/material.dart';
import '../model/accommodation.dart';
import '../model/place.dart';


class PlaceDetailsPage extends StatefulWidget {
  final String title;
  final String info;
  final String location;
  final String? image;


  const PlaceDetailsPage({super.key, required this.title, required this.info, required this.location, this.image});

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.image!,
                height: height * 30,
                width: width * 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20,),

            AutoSizeText(
              widget.info,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: AutoSizeText(
                "Konum",
                style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),

            AutoSizeText(
              widget.location,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
