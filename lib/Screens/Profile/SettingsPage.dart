import 'package:bursary_inn/Screens/SettingsSubPages/PrivacyPolicy.dart';
import 'package:bursary_inn/Screens/SettingsSubPages/TermsandCondition.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';


class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {

  Future<void> launchPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);

      await launchUrl(uri,mode: LaunchMode.externalApplication);

  }

  Future<void> launchEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Support Request',
    );
    await launchUrl(uri);
  }

  Future<void> launchWhatsApp(String phone) async {
    final Uri uri = Uri.parse("https://wa.me/$phone");
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
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
              // Card(
              //   color: Colors.white,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5.0),
              //   ),
              //   child: ListTile(
              //     onTap: (){
              //       Navigator.pushNamed(context, "/notification");
              //     },
              //     leading: Icon(Icons.notifications_none),
              //     title: Text("Notifications"),
              //   ),
              // ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ListTile(
                  onTap: (){
                    final parentContext = context;
                    showDialog(context: context, builder:(dialogContext){
                      int rating = 0;
                      return StatefulBuilder(
                        builder: (context,setState) {
                          return AlertDialog(
                            title: Text("Rate"),
                            content: FittedBox(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: List.generate(5, (index) {
                                  return IconButton(onPressed: () {
                                    setState(() {
                                      rating = index + 1;
                                    });
                                  },
                                    icon: Icon(
                                      index < rating ? Icons.star : Icons
                                          .star_border_outlined,
                                      size: 30,
                                      color: Colors.amber,),
                                  );
                                }),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: (){
                                  print("User rating: $rating");
                                  Navigator.pop(dialogContext);
                                  toastification.show(
                                    context: parentContext,
                                    type: ToastificationType.success,
                                    style: ToastificationStyle.flat,
                                    title: Text("Success"),
                                    alignment: Alignment.topRight,
                                    autoCloseDuration: Duration(seconds: 3),
                                    description: Text("Rating submitted"),
                                  );

                                },
                                child: Text("Submit"),
                              ),
                            ],

                          );
                        }
                      );
                    });
                  },
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
                  onTap:()async{
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Contact Us"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.phone),
                                title: const Text("Call Us"),
                                subtitle: const Text("+254 707943957"),
                                onTap: () => launchPhone("+254707943857"),
                              ),
                              ListTile(
                                leading: const Icon(Icons.chat),
                                title: const Text("WhatsApp"),
                                subtitle: const Text("Chat with support"),
                                onTap: () => launchWhatsApp("254707943857"),
                              ),
                              ListTile(
                                leading: const Icon(Icons.email),
                                title: const Text("Email"),
                                subtitle: const Text("bursaryadmin@gmail.com"),
                                onTap: () => launchEmail("bursaryadmin@gmail.com"),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      },
                   );
                  },
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
