import 'package:dreamlendar/services/theme_sevices.dart';
import 'package:dreamlendar/theme.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeService().theme,
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.system, // By default themeMode is ThemeMode.system
      home: WelcomeScreen(),
    );
  }
}

