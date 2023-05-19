import 'package:dragon_food/features/home/presentation/pages/home_page.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/splash/presentation/pages/splash.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashPage(),
    '/home-page': (context) => const HomePage(),
    '/login-page': (context) => const LoginPage(),
  };
}
