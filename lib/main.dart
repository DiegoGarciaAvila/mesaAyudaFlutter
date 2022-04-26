import 'package:flutter/material.dart';
import 'package:mesa_ayuda/routes/route.dart';
import 'package:mesa_ayuda/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mesa de ayuda',
      initialRoute: AppRoutesGlobal.initialRoute,
      onGenerateRoute: (settings){
        return AppRoutesGlobal.onGenerateRoute(settings);
      },
      routes:AppRoutesGlobal.getMenu(),
        theme: AppTheme().light,

    );
  }
}
