import 'package:flutter/material.dart';
import 'package:galaxy_planets_animation/screen/home_page.dart';
import 'package:galaxy_planets_animation/screen/planet_details.dart';


void main()
{
  runApp(
    MaterialApp(
      routes: {
        '/' : (Context) => Galaxy(),
        //'detail' : (context) => const Details(),
      },
    )
  );
}