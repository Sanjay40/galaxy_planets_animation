
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../utils/planet_list.dart';

class Details extends StatefulWidget {
  int ind;
  Details({super.key, required this.ind});

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
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          minimum: const EdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Center(
                child: Text("${Variable.planets[widget.ind]['name']}",
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5
                  ),
                ),
              ),
              const SizedBox(height: 60,),
              SizedBox(
                height: 400,
                child: ModelViewer(
                  src: Variable.planets[widget.ind]['file'],
                  autoRotate: true,
                ),
              ),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF052843).withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        AutoSizeText("${Variable.planets[widget.ind]['des']}",
                          maxLines: 5,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //height: 100,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
