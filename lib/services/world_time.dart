import 'package:http/http.dart' as http ;
import 'dart:convert';

import 'package:http/http.dart';


class WorldTime{

  //location name for UI
  late String location;
  //time in the location
  late String time;
  // url to an asset flag icon
  late String flag;
  // location url for API Endpoint
  late String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    // make request
    Response response = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    //print(data);


    // get properties from data
    String datetime =data['datetime'];
    String offset = data['utc_offset'].substring(1.3);
    //print(datetime);
    //print(offset);


    //create DateTime Object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    time = now.toString();




  }

}


