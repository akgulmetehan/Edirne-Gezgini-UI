import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestRoutePage extends StatefulWidget {
  const BestRoutePage({super.key});

  @override
  State<StatefulWidget> createState() => _BestRoutePageState();
}

class _BestRoutePageState extends State<BestRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
          title: const Text(
            "En Uygun Rota",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Text(
          'Size En Uygun Rotamız Şu Sekilde...',
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}