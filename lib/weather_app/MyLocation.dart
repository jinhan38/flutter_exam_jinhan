import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  /// 현재 위치정보 가져오기
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print("position : $position, latitude2 : $latitude2, longitude : $longitude2 ");
    } catch (e) {
      print("getLocation 인터넷 연결 실패 : $e");
    }
  }
}
