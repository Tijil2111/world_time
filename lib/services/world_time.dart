import 'package:http/http.dart' as http ;
import 'dart:convert';
import 'package:intl/intl.dart';

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
 // True or false if daytime or not
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {


    try{

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
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }

    catch (e){
      print('caught error:  $e');
      time = 'Could not get data';

    }




  }

}


