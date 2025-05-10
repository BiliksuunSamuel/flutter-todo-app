import 'package:bloc_todo/routes/app.routes.dart';
import 'package:bloc_todo/screens/welcome.screen.dart';
import 'package:bloc_todo/theme/app.theme.dart';
import 'package:bloc_todo/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    return GetMaterialApp(
      title: "IE Montrac",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppRoutes.welcomeScreen,
      getPages: AppRoutes.routes,
      home: const WelcomeScreen(),
    );
  }
}
