import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static requestNotificationPermission() {
    Permission.notification.isDenied.then((value) => {
          if (value) {Permission.notification.request()}
        });
  }

  static requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('permission granted');
    } else if (status.isDenied) {
      requestLocationPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
