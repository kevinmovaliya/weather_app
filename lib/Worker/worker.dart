import 'dart:convert';

import 'package:http/http.dart';

class Worker {
  String? location;

  Worker({this.location}) {
    location = this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  Future<void> getData() async {
    try {
      Response response = await get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=636c45a9348d33b9e3d722a114dd902c',
        ),
      );
      Map data = jsonDecode(response.body);

      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      Map wind = data['wind'];
      double getAir_speed = wind["speed"] / 0.27777777777778;

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      temp = getTemp.toString(); //C
      humidity = getHumidity; // %
      air_speed = getAir_speed.toString(); // km / hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'];
    } catch (e) {
      temp = "NA!";
      humidity = "NA!";
      air_speed = "NA!";
      description = "Can't Find Data!";
      main = "NA!";
      icon = "09d";
    }
  }
}
