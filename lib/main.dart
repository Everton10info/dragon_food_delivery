import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/remote_config/firebase_remote_config.dart';
import 'core/routes/app_routes.dart';
import 'firebase_options.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CustomRemoteConfig().initialize();
  await init();
  // await dotenv.load(fileName: '.env');
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
