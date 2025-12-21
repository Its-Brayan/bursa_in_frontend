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
                child: ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/notification");
                  },
                  leading: Icon(Icons.notifications_none),
                  title: Text("Notifications"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.star_border_outlined),
                  title: Text("Rate The App"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.article_outlined),
                  title: Text("Terms & Conditions"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.lock_outline),
                  title: Text("Privacy Policy"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text("Contact Us"),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
