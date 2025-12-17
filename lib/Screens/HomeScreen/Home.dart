import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                title: Text("Home",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
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
                    leading: Icon(Icons.home_outlined),
                    title: Text("Home",),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text("My Applications"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text("Profile",),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("Help & Support",),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings",),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout_outlined,color: Colors.red,),
                    title: Text("Logout",),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  )
                ],
              ),
            ), child: Container(
          color: Colors.amber,
        )
            ),
      ),
    );
  }
}
