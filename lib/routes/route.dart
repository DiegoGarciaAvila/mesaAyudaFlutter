import 'package:flutter/material.dart';
import 'package:mesa_ayuda/models/menu_models.dart';
import 'package:mesa_ayuda/screens/screens.dart';

class AppRoutesGlobal {
  static String initialRoute = 'Login';

  static final menuoption = <MenuOptions>[
    MenuOptions(screen: LoginScreen(), name: 'LoginScreen', route: 'Login'),
    MenuOptions(screen: UserHomeScreen(), name: 'UserHomeScreen', route: 'UserHome'),

  ];


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return const LoginScreen();
      },
    );
  }

  static Map<String, Widget Function(BuildContext)> getMenu(){
    Map<String, Widget Function(BuildContext)> appRoutes={};

    for(final option in menuoption){
      appRoutes.addAll({
        option.route: (BuildContext context)=>option.screen
      });
    }

    return appRoutes;


  }
}

