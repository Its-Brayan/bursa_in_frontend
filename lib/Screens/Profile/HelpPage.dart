import 'package:flutter/material.dart';
class Helppage extends StatefulWidget {
  const Helppage({super.key});

  @override
  State<Helppage> createState() => _HelppageState();
}

class _HelppageState extends State<Helppage> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
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
                    leading: Icon(Icons.star_border_purple500_sharp),
                    title: Text("Legal Terms & Conditions"),

                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.article_outlined),
                    title: Text("Send Feedback"),

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
                      child: ElevatedButton(onPressed: (){},
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
    );
  }
}
