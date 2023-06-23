import '../../features/categories/presentation/pages/categories_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashPage(),
    '/categories-page': (context) => const CategoriesPage(),
    '/home-page': (context) => const HomePage(),
    '/login-page': (context) => const LoginPage(),
  };
}
