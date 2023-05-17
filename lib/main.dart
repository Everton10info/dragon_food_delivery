import 'package:dragon_food/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await dotenv.load(fileName: '.env');
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
            primaryColor: const Color(0xffF1CE39),
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorStyle: TextStyle(color: Colors.amber),
              filled: true,
              fillColor: Color(0xFF474747),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ))),
        initialRoute: '/',
        routes: AppRoutes.routes);
  }
}
