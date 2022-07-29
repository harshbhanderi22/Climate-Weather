import 'package:climate/services/location.dart';
import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double longitude;
  late double latitude;
  location l = location();

  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async {
    await l.getlocation();

    var weatherdata = WeatherModel().weatherdata();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweatherdata: weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
