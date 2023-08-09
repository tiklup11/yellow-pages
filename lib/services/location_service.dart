import 'package:location/location.dart';

class LocationService {
  Future<LocationData> getLocationData(Location location) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw "location serive is not enabled";
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw "location permission is not granted";
      }
    }

    locationData = await location.getLocation();
    return locationData;
  }
}
