import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  void getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      print('\nLong is: $longitude\n Lat is: $latitude');
    } catch (e) {
      print('Error says: $e');
    }
  }
}
