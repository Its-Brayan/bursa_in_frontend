import 'package:bursary_inn/Screens/SettingsSubPages/PrivacyPolicy.dart';
import 'package:bursary_inn/Screens/SettingsSubPages/TermsandCondition.dart';
import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading: true,
    title: Text("SETTINGS",
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),),
    centerTitle: true,
  ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/notification");
                  },
                  leading: Icon(Icons.notifications_none),
                  title: Text("Notifications"),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.star_border_outlined),
                  title: Text("Rate The App"),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => TermsandCondition()));
                  },
                  leading: Icon(Icons.article_outlined),
                  title: Text("Terms & Conditions"),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Privacypolicy()),
                    );
                  },
                  leading: Icon(Icons.lock_outline),
                  title: Text("Privacy Policy"),
                ),
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text("Contact Us"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
