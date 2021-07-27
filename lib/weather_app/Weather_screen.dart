import 'package:flutter/material.dart';

class Weather_screen extends StatefulWidget {
  Weather_screen({required this.parseWeatherData});

  final dynamic parseWeatherData;

  @override
  _Weather_screenState createState() => _Weather_screenState();
}

class _Weather_screenState extends State<Weather_screen> {
  String name = "";
  int temp = 0;


  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
    print("widget.parseWeatherData : ${widget.parseWeatherData}");
  }

  void updateData(dynamic weather) {
    double tempDouble = weather['main']['temp'];
    temp = tempDouble.toInt();
    name = weather['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("날씨정보"), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('도시이름 : $name',
                  style: TextStyle(
                      fontSize: 16.0, color: Colors.deepPurpleAccent)),
              SizedBox(height: 20.0),
              Text('온도 : $temp',
                  style: TextStyle(
                      fontSize: 16.0, color: Colors.deepPurpleAccent)),
            ],
          ),
        ),
      ),
    );
  }
}
