import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'Souvenir'),
  initialRoute: "/",
  routes : {
    "/" : (context) => Loading(),
    "/home": (context) => Home(),
    "/chooseLocation": (context) => ChooseLocation()
  },
));

