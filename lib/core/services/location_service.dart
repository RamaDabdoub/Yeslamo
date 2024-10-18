import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
// اللوكيشن موجودي بالباكيج اللوكيشن وباكيج geo

class LocationService {
  Location location = Location();

  Future<LocationData?> getCurrentLocation({bool? showLoader = false}) async {
    LocationData? locationData;
    if (!await isServiceEnabled()) return null;
    if (!await isPermissionGranted()) return null;

    if (showLoader!) customLoader();

    locationData = await location.getLocation();
    BotToast.closeAllLoading();

    return locationData;
  }

  Future<geo.Placemark?> getLocationInfo(LocationData locationData,
      {bool? showLoader = false}) async {
    if (showLoader!) customLoader();
//عنا ليست من البليس مارك لان ممكن حدا يسمي المكان نفسو بكذا اسم ونحنا بناخد الاول تبع غوغل
    List<geo.Placemark>? placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

    BotToast.closeAllLoading();

    if (placemarks.isNotEmpty) {
      return placemarks.first;
    } else
      return null;
  }

  Future<bool> isServiceEnabled() async {
    bool serviceEnabled;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        //! --- Location is required ----
        return false;
      }
    }

    return serviceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        //!--- Permission required  --
        return false;
      }
    }

    return permissionGranted != PermissionStatus.denied;
  }
}
