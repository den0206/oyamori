import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:oyamori/src/screen/get_health/get_health_screen.dart';

class AppRoot {
  static final List<GetPage> pages = [..._mainPages];
}

final _mainPages = [
  GetPage(name: GetHealthScreen.routeName, page: () => const GetHealthScreen())
];
