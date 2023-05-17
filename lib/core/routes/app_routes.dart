import '../../features/login/presentation/pages/login_page.dart';
import '../../features/splash/presentation/pages/splash.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashPage(),
    '/login-page': (context) => const LoginPage(),
  };
}
