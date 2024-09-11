class WeatherModels {
  final String cityName;
  final double temperature;
  final String maincondition;

  WeatherModels(
      {required this.cityName,
      required this.maincondition,
      required this.temperature});

      
      factory WeatherModels.fromjson(Map<String,dynamic> json){
  return WeatherModels(cityName: json['name'], maincondition:json['weather'][0]['main'], temperature:  json['main']['temp'].toDouble());
}
}


