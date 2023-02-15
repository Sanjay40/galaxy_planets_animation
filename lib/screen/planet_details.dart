

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../utils/planet_list.dart';

class Details extends StatefulWidget {
  int? ind;
  Details({super.key, required int ind});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    //int? ind = ModalRoute.of(context)!.settings.arguments as int;
    //int? index = ModalRoute.of(context)!.settings.arguments as int;
    double h = MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/back image.jfif'),
          )
        ),
        child: SafeArea(
          minimum: const EdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Center(
                child: Text("${Variable.planets[widget.ind!]['name']}",
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 400,
                child: ModelViewer(
                  src: Variable.planets[widget.ind!]['file'],
                  autoRotate: true,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
