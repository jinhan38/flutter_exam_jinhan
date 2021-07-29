import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:flutter_exam/weather_app/model/model.dart';

class Weather_screen extends StatefulWidget {
  Weather_screen(
      {required this.parseWeatherData, required this.airPollutionData});

  final dynamic parseWeatherData;
  final dynamic airPollutionData;

  @override
  _Weather_screenState createState() => _Weather_screenState();
}

class _Weather_screenState extends State<Weather_screen> {
  String name = "";
  int temp = 0;
  late Widget icon;
  late Widget airIcon;
  late Widget airState;
  var dust1 = 0.0;
  var dust2 = 0.0;
  Model model = Model();
  var date = DateTime.now();
  var cityName = "";
  var description = "";

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData, widget.airPollutionData);
    print("widget.parseWeatherData : ${widget.parseWeatherData}");
  }

  void updateData(dynamic weather, dynamic air) {
    double tempDouble = weather['main']['temp'];
    temp = tempDouble.toInt();
    name = weather['name'];
    int condition = weather['weather'][0]['id'];
    icon = model.getWeatherIcon(condition);
    description = weather['weather'][0]['description'];

    int index = air['list'][0]['main']['aqi'];
    airIcon = Model().getAirIcon(index);
    airState = Model().getAirCondition(index);
    dust1 = air['list'][0]['components'][ 'pm10'];
    dust2 = air['list'][0]['components']['pm2_5'];
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext contexts) {
    return Scaffold(
      extendBodyBehindAppBar: true, //body를 앱바 위치까지 확장한다는 의미
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          iconSize: 30.0,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Stack(
          //Stack class는 위에서 아래로 하나하나 쌓는다고 이해하면 된다.
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              //fit : BoxFit.coverdmf dldydgo 지정한 영역을 꽉 채우도록 해준다.
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 150.0),
                            Text(
                              name,
                              style: GoogleFonts.lato(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  Duration(minutes: 1),
                                  builder: (context) {
                                    print(getSystemTime());
                                    return Text(
                                      getSystemTime(),
                                      style: GoogleFonts.lato(
                                          fontSize: 16.0, color: Colors.white),
                                    );
                                  },
                                ),
                                Text(
                                  DateFormat(' - EEEE').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                Text(
                                  DateFormat(', d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                icon,
                                SizedBox(width: 10.0),
                                Text('$description',
                                    style: GoogleFonts.lato(
                                        fontSize: 16.0, color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질치수)',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              airIcon,
                              SizedBox(height: 10.0),
                              airState,
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '$dust1',
                                style: GoogleFonts.lato(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'ug/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '$dust2',
                                style: GoogleFonts.lato(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'ug/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
