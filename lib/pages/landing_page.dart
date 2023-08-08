import 'package:flutter/cupertino.dart';
import 'package:yellow_pages/pages/service_page.dart';
import 'package:yellow_pages/pages/manage_routes_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  ///these are KEYS which are assigned to every Tab,
  ///the problem of navigation is solved by these KEYS
  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();

  CupertinoTabController tabController =
      CupertinoTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    // tabController = CupertinoTabController(initialIndex: 0);
  }

  List homeScreenList = [
    const ServicePage(),
    const RouteManagerPage(),
  ];

  ///welcome Page will be shown after user sign in with google
  ///basically Welcome Home page
  WillPopScope buildLandingPage(BuildContext context) {
    final listOfKeys = [firstTabNavKey, secondTabNavKey];

    return WillPopScope(
      onWillPop: () async {
        return !await listOfKeys[tabController.index].currentState!.maybePop();
      },
      child: CupertinoTabScaffold(
        controller: tabController,
        tabBar: CupertinoTabBar(
          items: const [
            ///this is where we are setting aur bottom ICONS
            BottomNavigationBarItem(
                label: 'Service', icon: Icon(CupertinoIcons.location)),
            BottomNavigationBarItem(
                label: 'Manage', icon: Icon(CupertinoIcons.settings)),
          ],
        ),
        tabBuilder: (
          context,
          index,
        ) {
          return CupertinoTabView(
            navigatorKey: listOfKeys[index],
            builder: (context) {
              return SafeArea(child: homeScreenList[index]);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildLandingPage(context);
  }
}
