import 'package:auto_route/auto_route.dart';
import 'package:cuberto_bottom_bar/internal/cuberto_bottom_bar.dart';
import 'package:cuberto_bottom_bar/internal/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/bottom_nav.dart';
import 'package:ekasys/routes/app_router.gr.dart';

import '../../widgets/custom_button.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends ConsumerState<HomeScreen> {
  late TabsRouter tabsRouter;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _showExitConfirmationDialog(context);
      },
      child: AutoTabsRouter.pageView(
        physics: const NeverScrollableScrollPhysics(),
        routes: const [
          HomeTab(),
          MenuTab(),
          AccountTab()
        ],
        builder: (context, child, _) {
          tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: child,
            bottomNavigationBar: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                 Radius.circular(30.0),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: CubertoBottomBar(
                barBorderRadius: BorderRadius.circular(40),
                barBackgroundColor: Colors.blueAccent,
                selectedTab: tabsRouter.activeIndex,
                inactiveIconColor: Colors.white,
                textColor: Colors.blueAccent,
                tabs: [
                  TabData(
                    iconData: Icons.home,
                    title: 'Home',
                  ),
                  TabData(
                    iconData: Icons.space_dashboard_rounded,
                    title: 'Menu',
                  ),
                  TabData(
                    iconData: Icons.person,
                    title: 'User',
                  ),
                ],
                onTabChangedListener: (int position, String title, Color? tabColor) {
                  final activeIndex = tabsRouter.activeIndex;
                  late String emptyRoute;
                  late String popUntil;
                  switch (position) {
                    case 0:
                      emptyRoute = HomeEmptyRoute.name;
                      popUntil = HomeTab.name;
                      break;

                    case 1:
                      emptyRoute = MenuEmptyRoute.name;
                      popUntil = MenuTab.name;
                      break;

                    case 2:
                      emptyRoute = AccountsEmptyRoute.name;
                      popUntil = AccountTab.name;
                      break;
                  }

                  if (position == activeIndex) {
                    context
                        .innerRouterOf<StackRouter>(emptyRoute)!
                        .popUntil((route) => route.data?.name == popUntil);
                  } else {
                    tabsRouter.setActiveIndex(position);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    bool shouldExit = false;

    await showDialog(
      context: context,
      barrierDismissible: false, // User must choose an option
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Do you really want to exit the app?'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,width: 70,
                child: CustomButton(
                  onPressed: () {
                    shouldExit = false;
                    Navigator.of(context).pop();
                  },
                  title: 'No',
                  showActions: false,
                ),
              ),
              SizedBox(width: 10,),
              SizedBox(
                height: 40,width: 90,
                child: CustomButton(
                  onPressed: () {
                    shouldExit = true;
                    Navigator.of(context).pop();
                  },
                  title: 'Yes',
                  showActions: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
    return shouldExit;
  }
}