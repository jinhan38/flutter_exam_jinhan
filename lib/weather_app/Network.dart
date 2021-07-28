import 'package:http/http.dart' as http;
import 'dart:convert';
//as http를 붙이면 이 패키지를 호출할 때 앞에 http로 호출할 수 있다.
//다시 말해 extension class 처럼 된 것이다.
class Network {
  Network({required this.url, required this.url2});

  String url = "";
  String url2 = "";


  Future<dynamic> fetchData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print('getLocation error code : ${response.statusCode}');
    }
  }

  Future<dynamic> fetchAirData() async {
    http.Response response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print('getLocation error code : ${response.statusCode}');
    }
  }
}
