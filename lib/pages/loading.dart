import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:get/get.dart';
import 'package:world_time/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  void getWorldTime() async{
    WorldTime wt = WorldTime(location: 'Casablanca', flag: 'Morocco', url: 'Africa/Casablanca');
    await wt.getTime();
    Get.offAll(() => Home(), arguments: [wt.time, wt.location, wt.flag, wt.isDay]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
            child: SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}

