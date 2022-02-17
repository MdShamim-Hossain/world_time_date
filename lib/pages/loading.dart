import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location_wise_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time="Loading";


  void setupWorldTime() async {
    WorldTime instance=  WorldTime(url: "Asia/Dhaka", location: "Dhaka, Bangladesh", flag: "bangladesh.png" );
    await instance.getTime();

    print("Huh! You have done enough. It's ${instance.time}'o clock");

    print(instance.location+instance.time+instance.flag);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "time": instance.time,
      "date": instance.date,
      "flag": instance.flag,
      "isDaytime": instance.isDaytime,
    });


  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 70.0,
        ),
      )
    );
  }
}
