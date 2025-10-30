import 'package:bursary_inn/Screens/Details/AllDetails.dart';
import 'package:bursary_inn/Screens/Details/PersonalDetails.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Screens/Authentication/Login.dart';
import 'package:bursary_inn/Screens/Authentication/Singup.dart';
import 'package:bursary_inn/Screens/Authentication/AfterSplash.dart';
import 'package:bursary_inn/Screens/Authentication/OTP.dart';
import 'package:bursary_inn/Screens/Authentication/Congratulations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/aftersplash',
      routes: {
        //Authentication routes
        '/congrats':(context) => Congratulations(),
        '/otp':(context) => OTP(),
        '/aftersplash':(context) => Aftersplash(),
        '/login':(context) => Login(),
        '/signup':(context) => Signup(),

        //Details routes
        '/alldetails':(context) => AllDetails(),
        '/personaldetails':(context) => Personaldetails(),

      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

