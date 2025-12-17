import 'package:bursary_inn/Screens/Activity/ActivityPage.dart';
import 'package:bursary_inn/Screens/Details/AllDetails.dart';
import 'package:bursary_inn/Screens/Details/BankDetails.dart';
import 'package:bursary_inn/Screens/Details/DocumentDetails.dart';
import 'package:bursary_inn/Screens/Details/EducationDetails.dart';
import 'package:bursary_inn/Screens/Details/FamilyDetails.dart';
import 'package:bursary_inn/Screens/Details/PersonalDetails.dart';
import 'package:bursary_inn/Screens/Explore/ExplorePage.dart';
import 'package:bursary_inn/Screens/HomeScreen/Home.dart';
import 'package:bursary_inn/Screens/Profile/ProfilePage.dart';
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
         '/familydetails':(context) => Familydetails(),
        '/educationdetails':(context) => Educationdetails(),
        '/documentdetails':(context) => Documentdetails(),
        '/bankdetails':(context) => Bankdetails(),

        //Home routes
        "/home":(context) => MyHomePage(),

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
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentindex = 0;
  final List<Widget> _screens = [
    Home(),
    Explorepage(),
    Activitypage(),
    Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey.shade500,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey.shade500,
        ),
        currentIndex: _currentindex,
          onTap: (index){
          setState(() {
            _currentindex = index;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.explore),label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.timeline),label: 'Activity'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
          ]
      ),
    );
  }
}

