import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  // ignore: non_constant_identifier_names
  final String api_key;

  WeatherServices(this.api_key);

  Future<WeatherModels> getweathermodels(String cityName) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?q=$cityName&appid=$api_key'));

    if (response.statusCode == 200) {
      return WeatherModels.fromjson(jsonDecode(response.body));
    } else {
      throw Exception("failed");
    }
  }

  Future<String> getpermission() async {
    //get permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    //fetch the cirent location
    Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high);
    //convert the location
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //city name
    String? city = placemarks[0].locality;
   return city?? "";
  }
}
