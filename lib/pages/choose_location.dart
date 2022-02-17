import 'package:flutter/material.dart';
import 'package:location_wise_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Asia/Baghdad', location: 'Baghdad, Iraq', flag: 'iraq.jpg'),
    WorldTime(url: 'America/Belem', location: 'Balem, Brazil', flag: 'brazil.png'),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flag: 'barbados.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok, Thailand', flag: 'thailand.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin, Germany', flag: 'germany.png'),
    WorldTime(url: 'Europe/Budapest', location: 'Budapest, Hungary', flag: 'hungary.gif'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires, Argentina', flag: 'argentina.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo, Egypt', flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago, USA', flag: 'usa.png'),
    WorldTime(url: 'Asia/Colombo', location: 'Colombo, Sri Lanka', flag: 'sri_lanka.jpg'),
    WorldTime(url: 'Europe/Copenhagen', location: 'Copenhagen, Denmark', flag: 'denmark.png'),
    WorldTime(url: 'America/Costa_Rica', location: 'Costa Rica', flag: 'costa_rica.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Dhaka, Bangladesh', flag: 'bangladesh.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai, UAE', flag: 'united_arab_emirates.png'),
    WorldTime(url: 'Europe/Dublin', location: 'Dublin, Ireland', flag: 'ireland.png'),
    WorldTime(url: 'Pacific/Fiji', location: 'Fiji', flag: 'fiji.png'),
    WorldTime(url: 'Asia/Gaza', location: 'Gaza, Palestine', flag: 'palestine.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hong_kong.png'),
    WorldTime(url: 'Pacific/Honolulu', location: 'Honolulu, Hawaii', flag: 'hawaii.jpg'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul, Turkey', flag: 'turkey.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta, Indonesia', flag: 'indonesia.png'),
    WorldTime(url: 'America/Jamaica', location: 'Jamaica', flag: 'jamaica.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'Johannesburg,South Africa', flag: 'south_africa.jpg'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi, Pakistan', flag: 'pakistan.png'),
    WorldTime(url: 'Asia/Kathmandu', location: 'Kathmandu, Nepal', flag: 'nepal.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata, india', flag: 'india.png'),
    WorldTime(url: 'Asia/Kabul', location: 'Kabul, Afghanistan', flag: 'afghanistan.jpg'),
    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon, Portugal', flag: 'portugal.png'),
    WorldTime(url: 'Europe/London', location: 'London, UK', flag: 'uk.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles, USA', flag: 'usa.png'),
    WorldTime(url: 'Europe/Luxembourg', location: 'Luxembourg', flag: 'luxembourg.png'),
    WorldTime(url: 'Atlantic/Madeira', location: 'Madeira', flag: 'madeira.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid, Spain', flag: 'spain.jpg'),
    WorldTime(url: 'Indian/Maldives', location: 'Maldives', flag: 'maldives.png'),
    WorldTime(url: 'Australia/Melbourne', location: 'Melbourne, Australia', flag: 'australia.jpg'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico', flag: 'mexico.jpg'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow, Russia', flag: 'russia.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi, Kenya', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York, USA', flag: 'usa.png'),
    WorldTime(url: 'Antarctica/Palmer', location: 'Palmer, Alaska', flag: 'alaska.png'),
    WorldTime(url: 'America/Panama', location: 'Panama', flag: 'panama.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris, France', flag: 'france.png'),
    WorldTime(url: 'America/Indiana/Petersburg', location: 'Petersburg', flag: 'petersburg.gif'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'qatar.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome, Italy', flag: 'italy.png'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh, Saudi Arabia ', flag: 'saudi_arabia.png'),
    WorldTime(url: 'America/Santiago', location: 'Santiago, Chile', flag: 'chile.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul, South Korea', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai, China', flag: 'china.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Atlantic/South_Georgia', location: 'South Georgia', flag: 'georgia.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney, Australia', flag: 'australia.jpg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo, Japan', flag: 'japan.png'),
    WorldTime(url: 'Pacific/Tahiti', location: 'Tahiti, French Polynesia', flag: 'french_polynesia.jpg'),
    WorldTime(url: 'America/Toronto', location: 'Toronto, Canada', flag: 'canada.png'),
    WorldTime(url: 'Africa/Tripoli', location: 'Tripoli, Libya', flag: 'libya.jpg'),
  ];

  void updateTime(index) async{
    WorldTime instance= locations[index];
    await instance.getTime();
    Navigator.pop(context,{
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: ListTile(
              onTap: (){
                setState(() {

                });
                updateTime(index);
                print(locations[index].location);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
