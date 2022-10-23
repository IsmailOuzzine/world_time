import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  WorldTime choosedLocation = WorldTime(location: 'Casablanca', flag: 'Morocco', url: 'Africa/Casablanca');
  String? bgImage;
  Color? bgColor;

  void initState() {
    super.initState();
    choosedLocation.time = Get.arguments[0];
    choosedLocation.location = Get.arguments[1];
    choosedLocation.flag = Get.arguments[2];
    choosedLocation.isDay = Get.arguments[3];
    bgImage = choosedLocation.isDay! ? 'day' : 'night';
    bgColor = choosedLocation.isDay! ? const Color.fromRGBO(18, 136, 200, 1) : const Color.fromRGBO(40, 39, 97, 1);
  }

  Widget locationText() {
    return Text(
      choosedLocation.location,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
      ),
    );
  }

  Widget flagPic() {
    return CircleAvatar(
      radius: 100.0,
      backgroundImage: AssetImage('assets/flags/${choosedLocation.flag}.png'),
    );
  }

  Widget timeText() {
    return Text(
      choosedLocation.time!,
      style: const TextStyle(
          color: Colors.white,
          fontSize: 30.0
      ),
    );
  }

  Widget chLocationBtn() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      icon: const Icon(
        Icons.location_on,
        color: Colors.blue,
      ),
      label: const Text(
          'Change location',
          style: TextStyle(
            color: Colors.blue,
          ),
      ),
      onPressed: () async {
        final wt = await Get.to(ChooseLocation());
        if(wt != null) {
          setState(() {
            choosedLocation = wt;
            bgImage = choosedLocation.isDay! ? 'day' : 'night';
            bgColor = choosedLocation.isDay! ? const Color.fromRGBO(18, 136, 200, 1) : const Color.fromRGBO(40, 39, 97, 1);
          });
        }
      }
    );
  }

  Widget myColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        locationText(),
        flagPic(),
        timeText(),
        chLocationBtn(),
      ],
    );
  }

  Widget initialContainer() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/${bgImage!}.png'),
              fit: BoxFit.cover,
          )
      ),
      child: Center(
        child: SizedBox(
          height: 500.0,
          child: myColumn(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor!,
      body: SafeArea(
          child : initialContainer()
      ),
    );
  }
}
