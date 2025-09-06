import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:softvence_project/app/modules/home_screen/views/home_screen_view.dart';
import 'package:softvence_project/app/routes/app_pages.dart';

class LocationScreenController extends GetxController {
  var address = " ".obs;

  /// Request permission + fetch location
  Future<void> getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          address.value = "Location permission denied.";
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        address.value =
            "Location permissions are permanently denied. Please enable them in settings.";
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        String village = place.name ?? "";
        String thana = place.subLocality ?? "";
        String zila = place.subAdministrativeArea ?? "";
        String country = place.country ?? "";

        address.value = "$village,$thana,$zila,$country";
        Get.to(() => HomeScreenView(address: address.value));
      } else {
        address.value = "Address not found";
      }
    } catch (e) {
      address.value = "Error: $e";
    }
  }
}
