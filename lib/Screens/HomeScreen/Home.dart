import 'package:bursary_inn/Providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
  GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
          key: _sliderDrawerKey,
            appBar: SliderAppBar(
              config:SliderAppBarConfig(
                title:Text(''),
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
                    onTap: ()async{
                      await _userProvider.logout_user();
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
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                   Row(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search Bursaries',
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
              
                    children: [
                      Card(
                        color: Colors.blueAccent,
                       child: Wrap(
                         spacing: 0.5,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Column(
                               children: [
                                   Text("Explore Your \n Potential!",
                                 style: TextStyle(
                                   fontWeight: FontWeight.w900,
                                   fontSize: 20,
                                   color: Colors.white,
                                 ),),
                                 SizedBox(height: 10),
                                 Text("Time is precious,\nsave it",
                                 style: TextStyle(
                                   color: Colors.white70,
                                 ),),
                                 SizedBox(height: 15),
                                 ElevatedButton(onPressed: (){},
                                 style: ElevatedButton.styleFrom(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                   )
                                 ), child:Text("Check Eligibility",style: TextStyle(
                                   color: Colors.blueAccent,
                                 ),),)
                               ],
                             ),
                           ),
                           SizedBox(
                             height: 150,
                               width: 160,
                               child: Image.asset("Assets/paper4.png"))
                         ],
                       ),
                      ),
                  Card(
                    color: Colors.blueAccent,
                    child: Wrap(
                      spacing: 0.5,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Text("Explore Your \n Potential!",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),),
                              SizedBox(height: 10),
                              Text("Time is precious,\nsave it",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),),
                              SizedBox(height: 15),
                              ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ), child:Text("Check Eligibility",style: TextStyle(
                                color: Colors.blueAccent,
                              ),),)
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 160,
                            width: 160,
                            child: Image.asset("Assets/paper4.png"))
                      ],
                    ),
                  ),
                    ],
                  ),
                ),
                  SizedBox(height: 5),
                 Card(
              
                   child: ListTile(
                     leading: Text("Upcoming Deadlines",
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w900,
                     ),),
                     trailing: TextButton(onPressed: (){}, child: Text("View All",
                     style: TextStyle(
                       color: Colors.blueAccent,
                     ),
                     ),
                     ),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(2.0),
                     ),
                     tileColor:Colors.white,
                   ),
                 ),
                  SizedBox(height: 3),
                  Card(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.blue.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("AUG\n23",
                            style: TextStyle(
                              fontSize:13,
                              color: Colors.blue.shade400,
                              fontWeight: FontWeight.w900,
                            ),),
                        ),
                      ),
                      title: Text("Bursary of Kasarani Constituency"),
                      subtitle: Text("Ksh 5000 - ksh 7000"),
                      trailing: IconButton(onPressed: (){}, icon:Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blueAccent,)
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      tileColor:Colors.white,
                    ),
                  ),
                  SizedBox(height:3),
                  Card(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.blue.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("AUG\n29",
                            style: TextStyle(
                              fontSize:13,
                              color: Colors.blue.shade400,
                              fontWeight: FontWeight.w900,
                            ),),
                        ),
                      ),
                      title: Text("Bursary of Zima Constituency"),
                      subtitle: Text("Ksh 5000 - ksh 7000"),
                      trailing: IconButton(onPressed: (){}, icon:Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blueAccent,)
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      tileColor:Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  ListTile(
                    leading: Text("Trending Bursaries",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),),
                    trailing: TextButton(onPressed: (){}, child:Text("View All",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),) ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          child:Container(
                            color: Colors.white,
                            width: 200,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image.asset("Assets/need_of.jpeg",
                             fit: BoxFit.cover,),
                             Padding(
                               padding: const EdgeInsets.all(3.0),
                               child: Row(
                                 mainAxisSize: MainAxisSize.max,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("Award",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w900,
                                   ),),
                                   IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.grey.shade400,))
                                 ],
                               ),
                             ),
                             Text("Ksh 5000 - Ksh 7000",
                             style: TextStyle(
                               color: Colors.grey.shade500,
                             ),),
                             SizedBox(height: 9.0),
                             Text("Eligibility",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),),
                             Text("Kenyan Students with ID",style: TextStyle(
                               color: Colors.grey.shade500,
                             ),),
                             SizedBox(height:9),
                             Wrap(
                               spacing: 5,
                               children: [
                                 Text("Due Date:",style:TextStyle(
                                   fontWeight: FontWeight.w900,
                                 ),),
                                 Text("06/08/23",style: TextStyle(
                                   color: Colors.grey.shade500,
                                 ),),
                               ],
                             ),
                             SizedBox(height:5.0),
                             SizedBox(
                               width: double.infinity,
                               child: ElevatedButton(onPressed: (){},
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: Colors.blueAccent,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(3.0),
                                   )
                                 ), child: Text("Apply Now",
                               style: TextStyle(
                                 color: Colors.white,
                               ),),
                               ),
                             )
                           ],

                         ),
                          ),
                        ),
                        Card(
                          child:Container(
                            color: Colors.white,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("Assets/need_of.jpeg",
                                  fit: BoxFit.cover,),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Award",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.grey.shade400,))
                                    ],
                                  ),
                                ),
                                Text("Ksh 5000 - Ksh 7000",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),),
                                SizedBox(height: 9.0),
                                Text("Eligibility",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),),
                                Text("Kenyan Students with ID",style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),),
                                SizedBox(height:9),
                                Wrap(
                                  spacing: 5,
                                  children: [
                                    Text("Due Date:",style:TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),),
                                    Text("06/08/23",style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),),
                                  ],
                                ),
                                SizedBox(height:5.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        )
                                    ), child: Text("Apply Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ),
                                )
                              ],

                            ),
                          ),
                        ),
                        Card(
                          child:Container(
                            color: Colors.white,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("Assets/need_of.jpeg",
                                  fit: BoxFit.cover,),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Award",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.grey.shade400,))
                                    ],
                                  ),
                                ),
                                Text("Ksh 5000 - Ksh 7000",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),),
                                SizedBox(height: 9.0),
                                Text("Eligibility",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),),
                                Text("Kenyan Students with ID",style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),),
                                SizedBox(height:9),
                                Wrap(
                                  spacing: 5,
                                  children: [
                                    Text("Due Date:",style:TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),),
                                    Text("06/08/23",style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),),
                                  ],
                                ),
                                SizedBox(height:5.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(onPressed: (){},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                        )
                                    ), child: Text("Apply Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),
                                  ),
                                )
                              ],

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ListTile(
                  leading: Text("Recommended Bursaries",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),),
                  trailing: TextButton(onPressed: (){}, child: Text("View All",style:TextStyle(
                    color: Colors.blueAccent,
                  ),)),
                ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child:Row(
                      children: [
                    Card(
                      child:Container(
                        color: Colors.white,
                        width:250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                               children: [
                                 Text("Kasarani NGCDF",
                                 style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                 ),),
                                 IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
                               ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text("Amount",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),),
                                Text("Ksh 5000 - Ksh 7000",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Due Date",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),),
                                Text("06/08/23",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),),
                              ],
                            ),
                            SizedBox(height:10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                ), child: Text("Apply Now",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ),
                    ),
                        Card(
                          child:Container(
                            color: Colors.white,
                            width:250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text("Kasarani NGCDF",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Amount",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                      Text("Ksh 5000 - Ksh 7000",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Due Date",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                      Text("06/08/23",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(height:10),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                        backgroundColor: Colors.blueAccent,
                                      ), child: Text("Apply Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child:Container(
                            color: Colors.white,
                            width:250,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text("Kasarani NGCDF",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Amount",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                      Text("Ksh 5000 - Ksh 7000",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Due Date",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                      Text("06/08/23",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(height:10),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(onPressed: (){},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4.0),
                                        ),
                                        backgroundColor: Colors.blueAccent,
                                      ), child: Text("Apply Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
            ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
            ),
      ),
    );
  }
}
