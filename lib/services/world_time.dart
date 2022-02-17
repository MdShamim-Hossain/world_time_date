import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime{
  String location; //location name for the UI
  String time= ''; //time of that location
  String date= ''; //date of that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime= true; ////true or false if daytime or not

  WorldTime({required this.url, required this.location, required this.flag});

  Future<void> getTime() async{
    try{
      //make the request
      var mainUrl=Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response= await http.get(mainUrl);

      print(response.statusCode);
      Map data=await jsonDecode(response.body);

      //get properties from data
      String datetime= data['datetime'];
      String offset= data['utc_offset'];
      // print(datetime);
      // print(offset.substring(1,3));

      //create DateTime object
      DateTime now=DateTime.parse(datetime);
      // print(now);
      now= now.add(Duration(hours: int.parse(offset.substring(0,3))));
       //print(now);

      //set the date properly
      date = DateFormat.yMMMMd().format(now);
      // print(date);

      //set the time properly
      isDaytime= now.hour > 5 && now.hour < 18 ? true : false;
      time= DateFormat.jm().format(now);
      print(time);

    }
    catch(e){
      print("Caught an error: $e");
      time= "Sorry. Try Again!";
    }
  }

}
