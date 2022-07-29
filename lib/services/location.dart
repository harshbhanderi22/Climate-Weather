import 'package:geolocator/geolocator.dart';

class location {
  late double longitude;
  late double latitude;

  Future<void> getlocation() async {
    LocationPermission cpermission = await Geolocator.checkPermission();
    LocationPermission rpermission = await Geolocator.requestPermission();

    if (cpermission == false) {
      rpermission;
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        longitude = position.longitude;
        latitude = position.latitude;
      } catch (e) {
        print(e);
      }
    }
  }
}
