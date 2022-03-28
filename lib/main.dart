import 'package:dreamlendar/theme.dart';
import 'package:dreamlendar/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.system, // By default themeMode is ThemeMode.system
      home: WelcomeScreen(),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({ Key? key }) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   int thememode = 1;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   starting()async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     if(pref.getInt("thememode")!=null ){
//       thememode = pref.getInt("thememode")!;
//     }else{
//       pref.setInt("thememode", thememode );
//     }
//     setState(() {

//     });

//   }
//   toggletheme()async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     if(pref.getInt("thememode")==1 ){
//       pref.setInt("thememode", 0 );
//       thememode = 0;
//     }else{
//       pref.setInt("thememode", 1 );
//       thememode = 1;
//     }
//     setState(() {

//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//      debugShowCheckedModeBanner: false,
//       theme: lightThemeData(context),
//       darkTheme: darkThemeData(context),
//       // themeMode: ThemeMode.system, // By default themeMode is ThemeMode.system
//       themeMode: thememode == 1 ? ThemeMode.dark : ThemeMode.light,
//       home: WelcomeScreen(toggleCall: toggletheme,),
//     );
//   }
// }