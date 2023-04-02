import 'package:get/get.dart';

import '../src/ui/app_screen.dart';
import '../src/ui/pages/home_page.dart';
import '../src/ui/pages/welcome.dart';
import 'package:djepe/src/blocs/user/user_state.dart';


appRoutes() => [
      GetPage(
        name: '/welcome',
        page: () => Welcome(userState: userStatus.LOGGED_OUT,),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ), 
      GetPage(
        name: '/application',
        page: () => AppScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ), 
      GetPage(
        name: '/home',
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      

    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}