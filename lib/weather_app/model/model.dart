import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    } else if (condition < 800) {
      print("컨디션 확인 : 800");
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    } else {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    }
  }

  Widget getAirIcon(int index) {
    switch (index) {
      case 1:
        {
          return Image.asset(
            'image/good.png',
            width: 37.0,
            height: 35.0,
          );
        }
      case 2:
        {
          return Image.asset(
            'image/fair.png',
            width: 37.0,
            height: 35.0,
          );
        }
      case 3:
        {
          return Image.asset(
            'image/moderate.png',
            width: 37.0,
            height: 35.0,
          );
        }
      case 4:
        {
          return Image.asset(
            'image/poor.png',
            width: 37.0,
            height: 35.0,
          );
        }
      case 5:
        {
          return Image.asset(
            'image/bad.png',
            width: 37.0,
            height: 35.0,
          );
        }
      default:
        {
          return Image.asset(
            'image/good.png',
            width: 37.0,
            height: 35.0,
          );
        }
    }
  }

  Widget getAirCondition(int index) {
    switch (index) {
      case 1:
        {
          return Text('매우좋음',
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
        }
      case 2:
        {
          return Text('좋음',
              style:
              TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
        }
      case 3:
        {
          return Text('보통',
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.bold));
        }
      case 4:
        {
          return Text('나쁨',
              style:
              TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
        }
      case 5:
        {
          return Text('매우나쁨',
              style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold));
        }
      default:
        {
          return Text('매우좋음',
              style:
              TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold));
        }
    }
  }
}
