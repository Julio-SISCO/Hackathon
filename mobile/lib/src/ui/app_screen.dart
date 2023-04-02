import 'package:djepe/src/ui/pages/bookmarked_hotel.dart';
import 'package:djepe/src/ui/pages/home_page.dart';
import 'package:djepe/src/ui/pages/profile.dart';
import 'package:djepe/src/ui/pages/site_page.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../blocs/bottom_navigation/bottom_navigation_bloc.dart';
import '../blocs/bottom_navigation/bottom_navigation_event.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocBuilder<BottomNavigationBloc, int>(
              builder: (context, currentTabIndex) {
            switch (currentTabIndex) {
              case 0:
                return HomePage();
              case 1:
                return SiteScreen();
              case 2:
                return BookmarkedHostel();
              case 3:
                return ProfileScreen();
              default:
                return HomePage();
            }
          }),

          extendBody: true,
          bottomNavigationBar:BlocBuilder<BottomNavigationBloc, int>(
        builder: (context, currentTabIndex) => CustomBottomNavbar(currentTabIndex: currentTabIndex,))),
    );
  }
}

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key, required this.currentTabIndex,
  });
  final int currentTabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarTheme.color,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ],
            ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 8),
            child: GNav(
              selectedIndex: currentTabIndex,
              haptic: true, // haptic feedback
              tabBorderRadius: 30,
              curve: Curves.easeOutExpo, // tab animation curves
              duration: Duration(milliseconds: 400), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: Theme.of(context).textTheme.bodySmall!.color, // unselected icon color
              activeColor: Theme.of(context).bottomAppBarTheme.surfaceTintColor, // selected icon and text color
              tabBackgroundColor: Theme.of(context).cardColor, // selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 10), // navigation bar padding
              tabs: [
                GButton(
                  gap: 10,
                  textStyle: TextStyle(fontSize: 14, color: body),
                  iconSize: 23,
                  icon: FontAwesomeIcons.house,
                  text: 'Accueil',
                ),
                GButton(
                  gap: 10,
                  textStyle: TextStyle(fontSize: 14, color: body),
                  iconSize: 23,
                  icon: FontAwesomeIcons.mapLocationDot,
                  text: 'Sites',
                ),
                GButton(
                  gap: 10,
                  textStyle: TextStyle(fontSize: 14, color: body),
                  iconSize: 23,
                  icon: Icons.bookmark,
                  text: 'Mes Hôtels',
                ),
                GButton(
                  gap: 10,
                  textStyle: TextStyle(fontSize: 14, color: body),
                  iconSize: 23,
                  icon: Icons.person_2,
                  text: 'Profile',
                )
              ],
              onTabChange: (index) => context
                  .read<BottomNavigationBloc>()
                  .add(TabChangeEvent(index)),
            ),
          ),
        ),
      );
  }
}
