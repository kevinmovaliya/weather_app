import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "surat";
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? icon;
  String? main;

  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map search = ModalRoute.of(context)?.settings.arguments as Map;
    // if (search.isNotEmpty) {
    //   city = search['searchText'];
    // }

    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }

    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 180,
              ),
              Image.asset(
                "assets/images/Weather.png",
                height: 240,
                width: 240,
              ),
              const Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Made with 💎",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SpinKitWave(
                color: Colors.white,
                size: 50,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade300,
    );
  }
}
