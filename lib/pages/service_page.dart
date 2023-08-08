import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:settings_ui/settings_ui.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        // largeTitle: const Text('Yellow Pages'),
        leading: const Center(child: Text("Yellow Pages")),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('+ new event'),
          onPressed: () async {
            FlutterBackgroundService().invoke("setAsForeground");
            // print('+ pressed');
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //       builder: (context) => CreateNewClass(
            //             currentUser: widget.user,
            //           ),
            //       fullscreenDialog: true),
            // );
          },
        ),
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
                  title: const Text('Infra.market office'),
                ),
                SettingsTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Yellow pages'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
