import 'package:flutter_exam/Carousel/CarouselModel.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

  static Future<dynamic> fetchCarouselData() async {
    print('RemoteService fetchCarouselData start');
    try {
      var response = await client.get(
        Uri.parse("https://my-grocery-strapi.herokuapp.com/home-carousels"),
      );
      print(
          'RemoteService fetchCarouselData statusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        return carouselModelFromJson(response.body);
      }

      return null;
    } catch (e) {
      print(
          'RemoteService fetchCarouselData statusCode : ${e}');
      return null;
    }
  }
}
