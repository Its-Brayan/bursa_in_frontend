import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Screens/Activity/ActivityPage.dart';
import 'package:bursary_inn/Screens/Profile/FavoritesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';
import 'package:bursary_inn/Services/UserService.dart';
class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
  GlobalKey<SliderDrawerState>();
Map<String,dynamic>? _student_data;
Future<void> loaduser() async{
  final userdata = await UserService().get_student_profile();
  setState(() {
    _student_data = userdata;
  });
}
int approved_status = 0;
int pending_status = 0;
@override
void initState(){
  super.initState();
  loaduser();
  WidgetsBinding.instance.addPostFrameCallback((_)async {
    final provider = Provider.of<BursaryProvider>(context, listen: false);
    await provider.get_applied_bursaries();
  for(var i in provider.applied_bursaries){
    setState(() {
      if(i['status_choices'] == "Approved") {
        approved_status++;
      }
      else if(i['status_choices'] == "Pending"){
        pending_status++;
      }
    });



  }
  });


}

  @override
  Widget build(BuildContext context) {
  final userprovider = Provider.of<UserProvider>(context);
  final bursaryprovider = Provider.of<BursaryProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
            key: _sliderDrawerKey,
            appBar: SliderAppBar(
              config:SliderAppBarConfig(
                title:Text('My Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,),
                trailing: IconButton(onPressed: (){
                  Navigator.pushNamed(context, "/notification");
                }, icon:Icon(Icons.notifications_none_outlined)
                ),
              ),
            ),
            slider: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(120.0),
                          child: Image.asset("Assets/person1.png",
                            width: 70,
                            height: 70,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text("${_student_data?['full_name']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("${_student_data?['email']}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context,'/home');
                    },
                    leading: Icon(Icons.home_outlined,size: 18,),
                    title: Text("Home",
                      style: TextStyle(
                        fontSize:14,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/activity_page');
                    },
                    leading: Icon(Icons.history,size: 18,),
                    title: Text("My Applications",
                      style: TextStyle(
                        fontSize:14,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/profile');
                    },
                    leading: Icon(Icons.person_outline,size: 18,),
                    title: Text("Profile",
                      style: TextStyle(
                        fontSize:14,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/help');
                    },
                    leading: Icon(Icons.help_outline,size: 18,),
                    title: Text("Help & Support",
                      style: TextStyle(
                        fontSize:14,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, '/settings');
                    },
                    leading: Icon(Icons.settings,size: 18,),
                    title: Text("Settings",
                      style: TextStyle(
                        fontSize:14,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    onTap: ()async{
                      await userprovider.logout_user();
                      Navigator.pushNamed(context, '/login');
                    },
                    leading: Icon(Icons.logout_outlined,color: Colors.red,size: 18,),
                    title: Text("Logout",
                      style: TextStyle(
                        fontSize:14,
                      ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  )
                ],
              ),
            ), child: Container(
          color: Colors.grey.shade50,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: _student_data == null ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ) : Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120.0),
                  child: Image.asset("Assets/person1.png",
                  width: 100,
                  height: 100,),
                ),
                SizedBox(height: 10),
                Text("${_student_data?['full_name']}",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),),
                Text("${_student_data?['email']}",
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
                ),
                SizedBox(height:7),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Applied",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                              Text("Approved",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("Pending",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(bursaryprovider.applied_bursaries.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),),
                            Text(approved_status.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),),
                            Text(pending_status.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height:8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(onPressed: (){
                     Navigator.pushNamed(context, '/studentdetails');
                    }, label: Text("Check Details",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.check_circle_outline_outlined,color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),),
                    ElevatedButton.icon(onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favoritespage()));
                    }, label: Text("Favourites",
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                      icon: Icon(Icons.favorite_outline_outlined,color: Colors.white,),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      iconAlignment: IconAlignment.end,
                      backgroundColor: Colors.blueAccent,
                    ),)
                  ],
                ),
                SizedBox(height: 10),
                 Card(
                   color: Colors.white,
                   child: Column(
                     children: [
                       ListTile(
                         leading: Icon(
                           Icons.article_outlined
                         ),
                         title: Text("My Applications"),
                         trailing:IconButton(onPressed: (){
                           Navigator.push(context,
                             MaterialPageRoute(
                               builder:(context) => Activitypage(),
                             ),
                           );
                         }, icon: Icon(Icons.keyboard_arrow_right_outlined,
                         size: 25,
                         color: Colors.blueAccent,)),
                       ),

                       ListTile(
                         leading: Icon(
                             Icons.settings
                         ),
                         title: Text("Settings"),
                         trailing:IconButton(onPressed: (){
                           Navigator.pushNamed(context, "/settings");
                         }, icon: Icon(Icons.keyboard_arrow_right_outlined,
                           size: 25,
                           color: Colors.blueAccent,)),
                       ),
                       ListTile(
                         leading: Icon(
                             Icons.help_outline
                         ),
                         title: Text("Help & Support"),
                         trailing:IconButton(onPressed: (){
                           Navigator.pushNamed(context, "/help");
                         }, icon: Icon(Icons.keyboard_arrow_right_outlined,
                           size: 25,
                           color: Colors.blueAccent,)),
                       )
                     ],
                   ),
                 ),
                SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: ()async{
                    await userprovider.logout_user();
                    Navigator.pushNamed(context, '/login');
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ), child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
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
