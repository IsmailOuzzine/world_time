import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String url;
  String? time;
  String flag;
  bool? isDay;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    var url = Uri.https('worldtimeapi.org', '/api/timezone/${this.url}');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      // code ...
      time = jsonResponse['datetime'];
      print(jsonResponse);
      print('------------------');
      DateTime now = DateTime.parse(time!).add(Duration(hours: int.parse(jsonResponse['utc_offset'].substring(0,3))));
      time = DateFormat('HH : mm').format(now);
      isDay = now.hour > 6 && now.hour < 20 ? true : false;
      print('time : $time');
    } else {
      print('error with statusCode :  ${response.statusCode}');
    }

  }


}