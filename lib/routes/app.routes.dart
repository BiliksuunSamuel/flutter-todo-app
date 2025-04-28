import 'package:bloc_todo/screens/task.create.screen.dart';
import 'package:get/get.dart';

import '../screens/home.screen.dart';
import '../screens/welcome.screen.dart';

class AppRoutes {
  static const String home = '/';
  static const welcomeScreen = "/welcome";
  static const createTask = "/createTask";
  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: createTask, page: () => const TaskCreateScreen()),
  ];
}
