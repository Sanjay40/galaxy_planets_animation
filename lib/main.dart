import 'package:flutter/material.dart';
import 'package:galaxy_planets_animation/screen/home_page.dart';



void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (Context) => Galaxy(),
        //'detail' : (context) => const Details(),
      },
    )
  );
}