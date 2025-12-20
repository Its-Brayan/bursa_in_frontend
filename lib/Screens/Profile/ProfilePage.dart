import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  GlobalKey<SliderDrawerState> _sliderDrawerKey =
  GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
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
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoODdpE2Tmv84gHri4Udqlt3-WndiRZ68xEg&s",
                            width: 70,
                            height: 70,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text("Ritik Merha",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        Text("Ritikmesh123@gmail.com",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
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
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(120.0),
                  child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoODdpE2Tmv84gHri4Udqlt3-WndiRZ68xEg&s",
                  width: 100,
                  height: 100,),
                ),
                SizedBox(height: 10),
                Text("Ritik Metrha",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),),
                Text("ritikmehra123@gmail.com",
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
                            Text("23",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),),
                            Text("12",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),),
                            Text("13",
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
                    ElevatedButton.icon(onPressed: (){}, label: Text("Check Eligibility",
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
                    ElevatedButton.icon(onPressed: (){}, label: Text("Favourites",
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
                         trailing:IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_outlined,
                         size: 25,
                         color: Colors.blueAccent,)),
                       ),

                       ListTile(
                         leading: Icon(
                             Icons.settings
                         ),
                         title: Text("Settings"),
                         trailing:IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_outlined,
                           size: 25,
                           color: Colors.blueAccent,)),
                       ),
                       ListTile(
                         leading: Icon(
                             Icons.help_outline
                         ),
                         title: Text("Help & Support"),
                         trailing:IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_outlined,
                           size: 25,
                           color: Colors.blueAccent,)),
                       )
                     ],
                   ),
                 ),
                SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Log Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
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
