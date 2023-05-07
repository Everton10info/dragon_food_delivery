import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dragon Food',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 29, 28, 28),
        ),
        routes: AppRoutes.routes);
  }
}
