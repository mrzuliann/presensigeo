import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<bool> checkLocationEnable() async {
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.requestPermission();

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  Future<LocationPermission> checkPermissionGetLocation() async {
    var permissionGranted = await Geolocator.checkPermission();

    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();

      if (permissionGranted != LocationPermission.always) {
        return LocationPermission.denied;
      } else {
        return LocationPermission.always;
      }
    } else {
      return LocationPermission.always;
    }
  }

  Future<Position> getLocationData() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
