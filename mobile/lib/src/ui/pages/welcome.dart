import 'dart:async';
import 'package:djepe/src/blocs/user/user_state.dart';
import 'package:djepe/src/ui/theme/color.dart';
import 'package:djepe/src/ui/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../blocs/user/user_bloc.dart';
import '../app_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key, required this.userState});
  final userStatus userState;
  static final homePage = new AppScreen();
  static final onboarding = new AppScreen();


// Function to choose what page to get to
 void  welcomeTo(){
    if (userState == userStatus.LOGGED_OUT) {
      timer(homePage);
    } else {
      timer(onboarding);
    }
  }

  // Timer to get to Onboarding page or Home page.
  void timer(page) {
    Timer(const Duration(seconds: 4), () => Get.off(page));
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
  //   void themeInit(isDarkMode){
  //   if (isDarkMode) {
  //           BlocProvider.of<ThemeBloc>(context).add(
  //                             ThemeChangeEvent(
  //                                 theme: AppTheme.DarkTheme ));
  //         } else {
  //           BlocProvider.of<ThemeBloc>(context).add(
  //                             ThemeChangeEvent(
  //                                 theme: AppTheme.LightTheme ));
  //         }
  // }


  //   themeInit(isDarkMode);
    
    // Call to the function
    welcomeTo();
    return BlocBuilder <UserBloc, UserState>(
      builder: (context, state) => Scaffold(
        backgroundColor: body,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("DjéPé",style: logoFont.copyWith(color: body)),
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
