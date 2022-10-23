import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  Widget myList() {
    List<WorldTime> wts = [
      WorldTime(location: 'Berlin', flag: 'Germany', url: 'Europe/Berlin'),
      WorldTime(location: 'Casablanca', flag: 'Morocco', url: 'Africa/Casablanca'),
      WorldTime(location: 'Denver', flag: 'USA', url: 'America/Denver'),
      WorldTime(location: 'Tokyo', flag: 'Japan', url: 'Asia/Tokyo'),
      WorldTime(location: 'Makkah', flag: 'Saudia', url: 'Asia/Riyadh'),
      WorldTime(location: 'London', flag: 'England', url: 'Europe/London'),
    ];    
    return ListView(
      children: wts.map((e) {
        return InkWell(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(240, 240, 240, 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    blurStyle: BlurStyle.outer
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${e.flag}.png'),
                  radius: 50.0,
                ),
                Text(
                  e.location,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                )
              ],
            ),
          ),
          onTap: () async {
            await e.getTime();
            Get.back(result: e);
          },
        );
      }).toList(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: myList(),
          ),
        ),
      ),
    );
  }
}

