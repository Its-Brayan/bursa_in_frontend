import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Screens/Explore/BursaryDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bursary_inn/Services/BursaryService/BursaryApplicationService.dart';
import 'package:toastification/toastification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
  GlobalKey<SliderDrawerState>();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<BursaryProvider>(context,listen: false).get_all_bursaries();
    }
    );
  }
  String format_date(String datestring){
    try{
      final date = DateTime.parse(datestring);
      return DateFormat('MMM d').format(date);
    }catch(e){
       return datestring;
    }
  }
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
                      await userProvider.logout_user();
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
                  Consumer<BursaryProvider>(
                    builder: (context,BursaryProvider,child) {
                      final bursaries = BursaryProvider.all_bursaries;

                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: bursaries.length,
                          itemBuilder: (context,index) {
                            final bursary = bursaries[index];
                            return Card(
                              child: ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.blue.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${format_date(bursary.bursary_deadline!)}",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.blue.shade400,
                                        fontWeight: FontWeight.w900,
                                      ),),
                                  ),
                                ),
                                title: Text("${bursary.bursary_name}"),
                                subtitle: Text("${bursary.bursary_amount}"),
                                trailing: IconButton(onPressed: () {
                                Navigator.push(
                                    context,
                                MaterialPageRoute(
                                    builder:(context) => Bursarydetailspage(bursaryId: bursary.id!),
                                ),
                                );
                                },
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      color: Colors.blueAccent,)
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                tileColor: Colors.white,
                              ),
                            );
                          }
                        ),
                      );
                    }
                  ),

                  SizedBox(height: 15),
                  ListTile(
                    leading: Text("Trending Bursaries",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),),
                    trailing: TextButton(onPressed: (){
                      Navigator.pushNamed(context, "/explore");
                    }, child:Text("View All",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),) ),
                  ),
                  Consumer<BursaryProvider>(
                    builder: (context,BursaryProvider,child) {
                      final bursaries = BursaryProvider.all_bursaries;
                      return SizedBox(
                        height: 340,
                        child: ListView.builder(
                          itemCount: bursaries.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) {
                            final bursary = bursaries[index];
                            return
                              Card(
                                  child: Container(
                                    color: Colors.white,
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image.asset("Assets/need_of.jpeg",
                                          fit: BoxFit.cover,),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text("Award",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                ),),
                                              IconButton(onPressed: () {},
                                                  icon: Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color: Colors.grey.shade400,))
                                            ],
                                          ),
                                        ),
                                        Text("${bursary.bursary_name} - ${bursary.bursary_amount}",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),),
                                        SizedBox(height: 9.0),
                                        Text("Eligibility",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                          ),),
                                        Text("Kenyan Students with ID",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),),
                                        SizedBox(height: 9),
                                        Wrap(
                                          spacing: 5,
                                          children: [
                                            Text("Due Date:", style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                            ),),
                                            Text("${bursary.bursary_deadline}", style: TextStyle(
                                              color: Colors.grey.shade500,
                                            ),),
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(onPressed: ()async{
                                            final success = await BursaryApplicationService().apply_for_bursary(bursary.id!);
                                            if(success){
                                              toastification.show(
                                                  context: context, // optional if you use ToastificationWrapper
                                                  type: ToastificationType.success,
                                                  style: ToastificationStyle.flat,
                                                  autoCloseDuration: const Duration(seconds: 5),
                                                  title: Text('Success',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                  ),),
                                                  // you can also use RichText widget for title and description parameters
                                                  description: RichText(text: TextSpan(text: "You have successfully applied for ${bursary.bursary_name} bursary",
                                                      style:TextStyle(
                                                        color: Colors.green,
                                                        fontWeight: FontWeight.bold,
                                                      )
                                                      )),
                                                  alignment: Alignment.topRight,

                                                  animationDuration: const Duration(milliseconds: 200),
                                                  icon: const Icon(Icons.check),
                                                  showIcon: true, // show or hide the icon
                                                  primaryColor: Colors.green,
                                                  backgroundColor: Colors.white,
                                                  foregroundColor: Colors.black,
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                  borderRadius: BorderRadius.circular(12),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0x07000000),
                                                      blurRadius: 16,
                                                      offset: Offset(0, 16),
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                  showProgressBar: true,
                                                  closeButton: ToastCloseButton(
                                                    showType: CloseButtonShowType.onHover,
                                                    buttonBuilder: (context, onClose) {
                                                      return OutlinedButton.icon(
                                                        onPressed: onClose,
                                                        icon: const Icon(Icons.close, size: 20),
                                                        label: const Text('Close'),
                                                      );
                                                    },
                                                  ),
                                                  closeOnClick: false,
                                                  pauseOnHover: true,
                                                  dragToClose: true,
                                                  applyBlurEffect: true,
                                              );
                                            }else{
                                              toastification.show(
                                                context: context, // optional if you use ToastificationWrapper
                                                type: ToastificationType.success,
                                                style: ToastificationStyle.flat,
                                                autoCloseDuration: const Duration(seconds: 5),
                                                title: Text('Failed',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),),
                                                // you can also use RichText widget for title and description parameters
                                                description: RichText(text: TextSpan(text: 'You have already applied for ${bursary.bursary_name} bursary',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                                alignment: Alignment.topRight,

                                                animationDuration: const Duration(milliseconds: 200),
                                                icon: const Icon(Icons.error_outline),
                                                showIcon: true, // show or hide the icon
                                                primaryColor: Colors.red,
                                                backgroundColor: Colors.white,
                                                foregroundColor: Colors.black,
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                borderRadius: BorderRadius.circular(12),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x07000000),
                                                    blurRadius: 16,
                                                    offset: Offset(0, 16),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                showProgressBar: true,
                                                closeButton: ToastCloseButton(
                                                  showType: CloseButtonShowType.onHover,
                                                  buttonBuilder: (context, onClose) {
                                                    return OutlinedButton.icon(
                                                      onPressed: onClose,
                                                      icon: const Icon(Icons.close, size: 20),
                                                      label: const Text('Close'),
                                                    );
                                                  },
                                                ),
                                                closeOnClick: true,
                                                pauseOnHover: true,
                                                dragToClose: true,
                                                applyBlurEffect: true,
                                              );
                                            }

                                          },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors
                                                    .blueAccent,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(3.0),
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
                                );
                          }
                        ),
                      );
                    }
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
