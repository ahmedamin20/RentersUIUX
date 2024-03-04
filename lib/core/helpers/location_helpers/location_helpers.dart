import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as gecoding;

class LocationHelpers {
  late Location location;

  // singleton
  LocationHelpers._() {
    location = Location();
    updateMyLocation();
  }

  static LocationHelpers instance = LocationHelpers._();

  Future<void> checkAndRequestLocationService() async {
    // check location service
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        // action Error Message
      }
    }
  }

  Future<bool> checkAndRequestLocationPermission() async {
    // check location service
    var permissonStatus = await location.hasPermission();
    if (permissonStatus == PermissionStatus.denied ||
        permissonStatus == PermissionStatus.deniedForever) {
      permissonStatus = await location.requestPermission();
      if (permissonStatus != PermissionStatus.granted) {
        return false;
        // action Error Message
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  LocationData? currentLocation;

  Future<void> getLocationData() async {
    location.changeSettings(distanceFilter: 5000); // mater distance
    location.onLocationChanged.listen((LocationData currentLocation) {
      this.currentLocation = currentLocation;
      print(
          "Location: ${currentLocation.latitude} , ${currentLocation.longitude}");
    });
  }

  Future<bool> updateMyLocation() async
  {
    await checkAndRequestLocationService();
    var hasPermisson = await checkAndRequestLocationPermission();

    if (hasPermisson)
    {
      await getLocationData();
      return true;
    } else
    {
      return false;
      // action Error Message
    }
  }

  Future<List<gecoding.Placemark>> getAddress(
      double latitude, double longitude) async {
    try {
      List<gecoding.Placemark> placemarks =
          await gecoding.placemarkFromCoordinates(latitude, longitude);
      gecoding.Placemark place = placemarks[0];
      print(place.name);
      return placemarks;
    } catch (e) {
      throw Exception("can not get location");
    }
  }
}
