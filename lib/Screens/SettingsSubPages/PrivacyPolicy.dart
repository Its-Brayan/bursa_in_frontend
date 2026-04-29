import 'package:flutter/material.dart';
class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Privacy Policy"),
       centerTitle: true,
     ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ExpansionTile(title:Text("Introduction",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
           children: [
             ListTile(
               title: Text("This Privacy Policy explains how the Bursary App collects, uses, and protects your personal information."),
             )
           ], ),
              ExpansionTile(title:Text("Information we collect",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("-full name \n -Email \n -phone number \n -Identification Details \n -Academic Information \n -Uploaded Documents(Images) \n -Application history and status"),
                  )
                ], ),
              ExpansionTile(title:Text("How we use your Information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("Your information is used to:"),
                    subtitle: Text("-process bursary information \n -verify eligibity \n -Communicate updates and notifications \n-Improve System Maintenance \n-Generate reports for administrators"),
                  )
                ], ),
              ExpansionTile(title:Text("Document Handling",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("-Uploaded documents are stored securely \n -Access is restricted to authorized personnel only\n -Documents are used solely for application evaluation"),
                  )
                ], ),
              ExpansionTile(title:Text("Data Sharing",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("We do NOT sell your data. However, data may be shared with:"),
                    subtitle: Text("-Authorized bursary review committees\n-Government or educational institutions (if required by law)"),
                  )
                ], ),
              ExpansionTile(title:Text("Data Security",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("We use appropriate security measures including:"),
                    subtitle: Text(" - Encrypted data transmission\n - Secure authentication\n - Role-based access control \n - Protected file storage"),
                  )
                ], ),
              ExpansionTile(title:Text("Data Retention",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text(" - Data is stored as long as necessary for bursary processing \n - Inactive or outdated data may be deleted periodically"),
                  )
                ], ),
              ExpansionTile(title:Text("User Rights",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("You may: "),
                    subtitle: Text(" - Access your personal data\n - Request corrections\n - Request deletion (subject to legal requirements)"),
                  )
                ], ),
              ExpansionTile(title:Text("Cookies & Tracking",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("If applicable the app may use:"),
                    subtitle: Text(" - Session tracking\n - Analytics tools to improve user experience\n - Role-based access control"),
                  )
                ], ),
              ExpansionTile(title:Text("Changes to Privacy Policy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("We may update this policy periodically. Users will be notified of major changes through the app."),
                  )
                ], ),
              ExpansionTile(title:Text("Contact Us",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                children: [
                  ListTile(
                    title: Text("For privacy concerns, contact support via the app’s Help/Support section."),
                  )
                ], ),
            ],
          ),
        ),
      ),
    );
  }
}
