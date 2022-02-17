import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    // data= ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // print(data);

    bool dayTime = data['isDaytime'];

    //set background
    String bgImage = dayTime ? "day-2.jpg" : "night.jpg";
    Color bgColor = dayTime ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    print(result);
                    setState(() {
                      data = {
                        'time': result['time'],
                        'date': result['date'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 2.0,
                        color: dayTime ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold, // fontFeatures: Fon
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .3),
                data['time'] == 'Sorry. Try Again!'
                    ? ElevatedButton(
                        onPressed: () async {
                          dynamic res =
                              await Navigator.pushNamed(context, '/location');
                          print(res);
                          setState(() {
                            data = {
                              'time': res['time'],
                              'date': res['date'],
                              'location': res['location'],
                              'isDaytime': res['isDaytime'],
                              'flag': res['flag']
                            };
                          });
                        },
                        child: Text("OOPS! Try Again",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(.5)),
                        ),
                      )
                    : Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 50.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                SizedBox(height: 20),
                Text(
                  data['date'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
