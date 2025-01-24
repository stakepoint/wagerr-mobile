// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/features/home_screen/naviagtion.dart';
import 'package:starkwager/routing/routes.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

// class HomeScreenTabletMenuBar extends StatefulWidget {
//   final Widget child;
//   const HomeScreenTabletMenuBar({
//     required this.child,
//     super.key,
//   });

//   @override
//   State<HomeScreenTabletMenuBar> createState() =>
//       _HomeScreenTabletMenuBarState();
// }

// class _HomeScreenTabletMenuBarState extends State<HomeScreenTabletMenuBar> {
//   int _currentIndex = 0;

//   void _onNavigate(String route) {
//     setState(() {
//       switch (route) {
//         case Routes.home_tablet:
//           _currentIndex = 0;
//           break;
//         case Routes.search_tablet:
//           _currentIndex = 1;
//           break;
//         case Routes.profile_tablet:
//           _currentIndex = 2;
//           break;
//         case Routes.settings_tablet:
//           _currentIndex = 3;
//           break;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: 208,
//             color: Colors.black,
//             child: Column(
//               children: [
//                 verticalSpace(64),
//                 SvgPicture.asset(AppIcons.logoIcon),
//                 verticalSpace(40),
//                 Container(
//                   height: 56,
//                   width: 160,
//                   decoration: BoxDecoration(
//                     color: AppColors.green100,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(AppIcons.handshakeIcon),
//                       const SizedBox(width: 12),
//                       Text(
//                         'New Wager',
//                         style: AppTheme.textMediumMedium.copyWith(
//                           color: AppColors.blue950,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 verticalSpace(120),
//                 _buildNavItem(
//                     0, 'Home', AppIcons.homeNoneIcon, Routes.home_tablet),
//                 _buildNavItem(
//                     1, 'Waggers', AppIcons.homeShakeIcon, Routes.search_tablet),
//                 _buildNavItem(
//                     2, 'Wallet', AppIcons.walletIcon, Routes.profile_tablet),
//                 _buildNavItem(
//                     3, 'Profile', AppIcons.profileIcon, Routes.settings_tablet),
//               ],
//             ),
//           ),
//           Expanded(child: widget.child),
//         ],
//       ),
//     );
//   }

// //----------------------------------------------- BUILDNAVBAR ----------------------------------------------- //

//   Widget _buildNavItem(int index, String label, String icon, String route) {
//     final isSelected = _currentIndex == index;
//     return GestureDetector(
//       onTap: () {
//         _onNavigate(route);
//         GoRouter.of(context).go(route);
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 32,
//             width: 64,
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? AppColors.grayCool400.withOpacity(0.1)
//                   : Colors.transparent,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Container(
//               height: 32,
//               width: 64,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: isSelected ? AppColors.grayCool800 : Colors.transparent,
//               ),
//               child: Center(
//                 child: SvgPicture.asset(
//                   icon,
//                   color: isSelected
//                       ? AppColors.green100
//                       : AppColors.grayneutral500,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? AppColors.green100 : AppColors.grayneutral500,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//           verticalSpace(12),
//         ],
//       ),
//     );
//   }
// }

class HomeScreenTabletMenuBar extends StatefulWidget {
  final Widget child;
  const HomeScreenTabletMenuBar({
    required this.child,
    super.key,
  });

  @override
  State<HomeScreenTabletMenuBar> createState() =>
      _HomeScreenTabletMenuBarState();
}

class _HomeScreenTabletMenuBarState extends State<HomeScreenTabletMenuBar> {
  int _currentIndex = 0;

  void _onNavigate(String route) {
    setState(() {
      switch (route) {
        case Routes.home_tablet:
          _currentIndex = 0;
          break;
        case Routes.search_tablet:
          _currentIndex = 1;
          break;
        case Routes.profile_tablet:
          _currentIndex = 2;
          break;
        case Routes.settings_tablet:
          _currentIndex = 3;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: isLandscape
          ? ScaffoldWithNavBar(child: widget.child)
          : Row(
              children: [
                _buildSideBar(),
                Expanded(child: widget.child),
              ],
            ),
    );
  }

  Widget _buildSideBar() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 208,
      color: Colors.black,
      child: Column(
        children: [
          verticalSpace(64),
          SvgPicture.asset(AppIcons.logoIcon),
          verticalSpace(40),
          _buildNewWagerButton(),
          verticalSpace(120),
          _buildNavItems(isVertical: true),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 80,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AppIcons.logoIcon),
          _buildNavItems(isVertical: false),
          _buildNewWagerButton(),
        ],
      ),
    );
  }

  Widget _buildNewWagerButton() {
    return Container(
      height: 56,
      width: 160,
      decoration: BoxDecoration(
        color: AppColors.green100,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.handshakeIcon),
          const SizedBox(width: 12),
          Text(
            'New Wager',
            style: AppTheme.textMediumMedium.copyWith(
              color: AppColors.blue950,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItems({required bool isVertical}) {
    final items = [
      {
        'index': 0,
        'label': 'Home',
        'icon': AppIcons.homeNoneIcon,
        'route': Routes.home_tablet
      },
      {
        'index': 1,
        'label': 'Waggers',
        'icon': AppIcons.homeShakeIcon,
        'route': Routes.search_tablet
      },
      {
        'index': 2,
        'label': 'Wallet',
        'icon': AppIcons.walletIcon,
        'route': Routes.profile_tablet
      },
      {
        'index': 3,
        'label': 'Profile',
        'icon': AppIcons.profileIcon,
        'route': Routes.settings_tablet
      },
    ];

    return isVertical
        ? Column(
            children: items
                .map((item) => _buildNavItem(
                      item['index'] as int,
                      item['label'] as String,
                      item['icon'] as String,
                      item['route'] as String,
                    ))
                .toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items
                .map((item) => _buildNavItem(
                      item['index'] as int,
                      item['label'] as String,
                      item['icon'] as String,
                      item['route'] as String,
                    ))
                .toList(),
          );
  }

  Widget _buildNavItem(int index, String label, String icon, String route) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        _onNavigate(route);
        GoRouter.of(context).go(route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 32,
            width: 64,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.grayCool400.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              height: 32,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isSelected ? AppColors.grayCool800 : Colors.transparent,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: isSelected
                      ? AppColors.green100
                      : AppColors.grayneutral500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.green100 : AppColors.grayneutral500,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
