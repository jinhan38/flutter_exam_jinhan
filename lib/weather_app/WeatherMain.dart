import 'package:flutter/material.dart';
import 'package:flutter_exam/weather_app/MyLocation.dart';
import 'package:flutter_exam/weather_app/Weather_screen.dart';
import 'Network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const api_key = "d408636772247d11fd077b7e4113b96d";

class WeatherMain extends StatefulWidget {
  @override
  _WeatherMainState createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  double latitude3 = 0.0;
  double longitude3 = 0.0;


  @override
  void initState() {
    callAPI();
  }

  //await는 future의 값이 return될 때 까지 기다려야 한다는 의미이다.
  Future<void> callAPI() async {
    var location = MyLocation();
    await location.getLocation();
    latitude3 = location.latitude2;
    longitude3 = location.longitude2;
    var network = Network(url: getUrl(), url2: getUrl2());
    var parsingData = await network.fetchData();
    var airData = await network.fetchAirData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Weather_screen(
                parseWeatherData: parsingData, airPollutionData: airData)));
  }

  String getUrl() {
    return "https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$api_key&units=metric";
  }

  String getUrl2() {
    return "http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$api_key";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Weather App',
//           style: TextStyle(color: Colors.white, fontSize: 16.0)),
//       backgroundColor: Colors.blue,
//       centerTitle: true,
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//               },
//               child: Text('Get my Location')),
//         ],
//       ),
//     ),
//   );
// }

}
