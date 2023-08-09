import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:location/location.dart';
import 'package:yellow_pages/services/permission_handler.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Location _location = Location();
  StreamSubscription<LocationData>? _locationSubscription;
  String loc = "null";
  _getLocation() async {
    try {
      final LocationData locationResult = await _location.getLocation();
      setState(() {
        loc = locationResult.toString();
      });

      print("location_data : $locationResult");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _listenLocation() async {
    _locationSubscription = _location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((LocationData currentlocation) async {
      // await FirebaseFirestore.instance.collection('location').doc('user1').set({
      //   'latitude': currentlocation.latitude,
      //   'longitude': currentlocation.longitude,
      //   'name': 'john'
      // }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: const CupertinoNavigationBar(
        // largeTitle: const Text('Yellow Pages'),
        leading: Center(child: Text("Yellow Pages")),
        // trailing: CupertinoButton(
        //   padding: EdgeInsets.zero,
        //   child: const Text('+ new event'),
        //   onPressed: () async {
        //     FlutterBackgroundService().invoke("setAsForeground");
        //     // print('+ pressed');
        //     // Navigator.push(
        //     //   context,
        //     //   CupertinoPageRoute(
        //     //       builder: (context) => CreateNewClass(
        //     //             currentUser: widget.user,
        //     //           ),
        //     //       fullscreenDialog: true),
        //     // );
        //   },
        // ),
      ),
      child: SafeArea(
        child: SettingsList(
          contentPadding: const EdgeInsets.only(top: 0),
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
              title: const Text('Closest once'),
              tiles: <SettingsTile>[
                SettingsTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('omr'),
                ),
                SettingsTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Yellow pages'),
                ),
                SettingsTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(loc),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
