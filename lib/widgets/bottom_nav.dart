// import 'package:cuberto_bottom_bar/internal/cuberto_bottom_bar.dart';
// import 'package:cuberto_bottom_bar/internal/tab_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:iconsax/iconsax.dart';
//
// import 'custom_button.dart';
//
//
// class HomeNavigationBar extends ConsumerWidget {
//   const HomeNavigationBar({
//     super.key,
//     required this.onTap,
//     this.currentIndex = 0,
//     this.showAlerts = true,
//     // this.showCart = false,
//   });
//
//   final ValueChanged<int> onTap;
//   final int currentIndex;
//   final bool showAlerts;
//   // final showCart;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final cart = ref.watch(cartProvider);
//     // final cartKey = ref.watch(navCartKeyProvider);
//     // final isRtl = Directionality.of(context) == TextDirection.rtl;
//     return CubertoBottomBar(
//       selectedTab: currentIndex,
//       tabs: [
//         TabData(
//           iconData: Icons.home,
//           title: 'Home',
//         ),
//         TabData(
//           iconData: Icons.home,
//           title: 'Menu',
//         ),
//         TabData(
//           iconData: Icons.home,
//           title: 'User',
//         ),
//       ],
//       onTabChangedListener: (int position, String title, Color? tabColor) {
//         final activeIndex = tabsRouter.activeIndex;
//         late String emptyRoute;
//         late String popUntil;
//         switch (index) {
//           case 0:
//             emptyRoute = HomeEmptyRoute.name;
//             popUntil = HomeTab.name;
//             break;
//
//           case 1:
//             emptyRoute = MenuEmptyRoute.name;
//             popUntil = MenuTab.name;
//             break;
//
//           case 2:
//             emptyRoute = AccountsEmptyRoute.name;
//             popUntil = AccountTab.name;
//             break;
//         }
//
//         if (index == activeIndex) {
//           context
//               .innerRouterOf<StackRouter>(emptyRoute)!
//               .popUntil((route) => route.data?.name == popUntil);
//         } else {
//           tabsRouter.setActiveIndex(index);
//         }
//       },
//     );
//   }
// }