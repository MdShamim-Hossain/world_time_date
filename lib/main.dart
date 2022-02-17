import 'package:flutter/material.dart';
import 'package:location_wise_time/pages/choose_location.dart';
import 'package:location_wise_time/pages/home.dart';
import 'package:location_wise_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
