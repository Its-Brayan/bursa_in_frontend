import 'package:bursary_inn/Screens/SettingsSubPages/FAQs.dart';
import 'package:bursary_inn/Screens/SettingsSubPages/TermsandCondition.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Services/HelpService.dart';
import 'package:bursary_inn/Models/HelpModel.dart';
import 'package:toastification/toastification.dart';
class Helppage extends StatefulWidget {
  const Helppage({super.key});

  @override
  State<Helppage> createState() => _HelppageState();
}

class _HelppageState extends State<Helppage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textinput = TextEditingController();

  @override
  void dispose(){
    _textinput.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: true,
      title: Text("HELP & SUPPORT"),
      centerTitle: true,
      
    ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FAQs()));
                      },
                      leading: Icon(Icons.notifications_none),
                      title: Text("FAQ's"),

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
                      leading: Icon(Icons.star_border_purple500_sharp),
                      title: Text("Legal Terms & Conditions"),

                    ),
                  ),

                  SizedBox(height: 11),
                  Text("Need More Help?",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),),
                  SizedBox(height: 7),
                  Text("We will get back to you as soon as possible",style: TextStyle(
                    color: Colors.grey.shade500,
                  ),),
                  SizedBox(height: 9),
                  TextFormField(
                    controller: _textinput,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Tell us how we can help you...",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: ()async{
                          final help = HelpModel(
                            help_text: _textinput.text
                          );
                        await  Helpservice().create_help(help);
                       _textinput.clear();
                      toastification.show(
                        context: context,
                        title: Text("Help Ticket submitted"),
                        autoCloseDuration: Duration(seconds: 5),
                        style: ToastificationStyle.minimal,
                      );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          backgroundColor: Colors.blueAccent,
                        ), child: Text("Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
