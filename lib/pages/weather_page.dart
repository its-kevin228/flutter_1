import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_services.dart';

// ignore: camel_case_types
class weather_page extends StatefulWidget {
  const weather_page({super.key});

  @override
  State<weather_page> createState() => _weather_pageState();
}

// ignore: camel_case_types
class _weather_pageState extends State<weather_page> {
  //api key
  // ignore: non_constant_identifier_names, unused_field
  final _WeatherServices = WeatherServices('c851a6b5a1d664112bc590288fdc304e');
  // ignore: unused_field, non_constant_identifier_names
  weather_page? _weather_page;
  //fetch weather
  fetchweather() async {
    //get the curretn city
    String cityName = await _WeatherServices.getcurentcity();
    //get weather for this city
    try {
      // ignore: non_constant_identifier_names
      final weather_page = await _WeatherServices.getweather_page(cityName);
      setState(() {
        _weather_page = weather_page;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch weather
    _fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(_weather_page?.cityName??""),
        ],
      ),
    ) 
    }
}
