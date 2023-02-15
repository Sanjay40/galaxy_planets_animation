import 'package:flutter/material.dart';
import 'package:galaxy_planets_animation/screen/planet_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../utils/planet_list.dart';

class Galaxy extends StatefulWidget {
  const Galaxy({Key? key}) : super(key: key);

  @override
  State<Galaxy> createState() => _GalaxyState();
}

class _GalaxyState extends State<Galaxy> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            child: Image(
              image: AssetImage('images/back image.jfif'),
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Galaxy Planets",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 0.5
                ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: 1/1.2,
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 15,
                      children: Variable.planets.map((e){
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Align(
                            alignment : Alignment.bottomCenter,
                            child: Container(
                                height: 190,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFF052843).withOpacity(0.8),
                                ),
                                //height: 100,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: 30,),
                              SizedBox(
                                height: 120,
                                width: 140,
                                child: ModelViewer(
                                  src: e['file'],
                                  autoRotate: true,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("${e['name']}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                letterSpacing: 0.5,
                                color: Colors.white,
                              ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment : Alignment.topLeft,
                                  child: Text("${e['type']}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      letterSpacing: 0.5,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,top: 10),
                                child: Align(
                                  alignment : Alignment.topLeft,
                                  child: Text("${e['year']}",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      letterSpacing: 0.5,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment : Alignment.topLeft,
                                      child: Text("${e['radius']}",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          letterSpacing: 0.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap : (){
                                      setState(() {
                                        //Navigator.pushNamed(context, 'details',arguments: Variable.planets.indexOf(e));
                                        //Navigator.pushNamed(context, 'detail', arguments: Variable.planets.indexOf(e));
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details(ind: Variable.planets.indexOf(e),)));
                                        print(Variable.planets.indexOf(e));
                                      });
                                      },
                                      child: Container(
                                        height: h/34,
                                        width: w/7.8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text("Details",
                                        style: GoogleFonts.poppins(
                                          color: Color(0xff052138),
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                          fontSize: 12,
                                        ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }).toList()

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
