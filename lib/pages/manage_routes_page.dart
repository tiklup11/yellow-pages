import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class RouteManagerPage extends StatefulWidget {
  const RouteManagerPage({super.key});

  @override
  State<RouteManagerPage> createState() => _RouteManagerPageState();
}

class _RouteManagerPageState extends State<RouteManagerPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: false,
        navigationBar: CupertinoNavigationBar(
          leading: const Center(child: Text("Manage routes")),

          // largeTitle: const Text('Yellow Pages'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('+ new route'),
            onPressed: () async {
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
          child: Container(
            child: SettingsList(
              contentPadding: const EdgeInsets.only(top: 0),
              platform: DevicePlatform.iOS,
              sections: [
                SettingsSection(
                  title: const Text('Your routes (Active/InActive)'),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(Icons.route),
                      title: const Text('Yellow pages building'),
                      value: const Text('English'),
                      trailing: const CupertinoCheckbox(
                        value: true,
                        onChanged: null,
                      ),
                    ),
                    SettingsTile.navigation(
                      leading: const Icon(Icons.route),
                      title: const Text('Truliv Ares'),
                      value: const Text('English'),
                      trailing: const CupertinoCheckbox(
                        value: true,
                        onChanged: null,
                      ),
                    ),
                  ],
                ),
                SettingsSection(
                  title: const Text('Common'),
                  tiles: <SettingsTile>[
                    SettingsTile(
                      leading: const Icon(Icons.delete_forever),
                      title: const Text('Delete all routes'),
                    ),
                    SettingsTile.switchTile(
                      onToggle: (value) {},
                      initialValue: true,
                      leading: const Icon(Icons.format_paint),
                      title: const Text('Enable custom theme'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
