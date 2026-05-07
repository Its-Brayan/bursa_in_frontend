import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Screens/Explore/BursaryDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:bursary_inn/Services/BursaryService/BursaryApplicationService.dart';
import 'package:toastification/toastification.dart';
import 'package:bursary_inn/Services/UserService.dart';
import 'package:bursary_inn/Services/BursaryService/FavoriteService.dart';
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
    loaduser();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<BursaryProvider>(context,listen: false).get_all_bursaries();
      Provider.of<BursaryProvider>(context,listen: false).get_applied_bursaries();
    }
    );
  }

  Map<String,dynamic>? _student_data;
  Future<void> loaduser() async{
    final userdata = await UserService().get_student_profile();
    setState(() {
      _student_data = userdata;
    });
  }
  String format_date(String datestring){
    try{
      final date = DateTime.parse(datestring);
      return DateFormat('MMM d').format(date);
    }catch(e){
       return datestring;
    }
  }
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          await BursaryProvider().get_all_bursaries();
        },
        child: SafeArea(
          child: SliderDrawer(
            key: _sliderDrawerKey,
              appBar: SliderAppBar(
                config:SliderAppBarConfig(
                  title:Text(''),
                  trailing: Consumer<BursaryProvider>(
                    builder: (context,BursaryProvider,child) {
                      return Stack(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(Icons.notifications),
                            onPressed: (){
                              Navigator.pushNamed(context,'/notification');
                            }
                          ),
                          if(BursaryProvider.unreadCount > 0)
                            Positioned(
                              right: 7,
                              top: 8,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Center(
                                  child: Text("${BursaryProvider.unreadCount}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                              ),
                            )
                        ],

                      );
                    }),
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
                        Navigator.pushNamed(context, '/home');
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
                      onTap: (){Navigator.pushNamed(context, '/activity_page');
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
                  SizedBox(height: 12),
                   Consumer<BursaryProvider>(
                      builder:(context,BursaryProvider,child){
                                    final bursaries = BursaryProvider.all_bursaries;
                                    final now = DateTime.now();
                                    final today = DateTime(now.year, now.month, now.day);
                                    final upcoming = bursaries.where((bursary){
                                    final parsed = DateTime.parse(bursary.bursary_deadline!);
                                    final deadline = DateTime(parsed.year,parsed.month,parsed.day);
                                    return deadline.isAfter(now) || deadline.isAtSameMomentAs(today);
                                    }).toList()
                                    ..sort((a,b){
                                    final dateA = DateTime.parse(a.bursary_deadline!);
                                    final dateB = DateTime.parse(b.bursary_deadline!);
                                    return dateA.compareTo(dateB);
                                    });
                                    return SizedBox(
                                    height: 200,
                                    child: upcoming.isEmpty? Center(child: Text("No uploaded bursaries yet"),) : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                    itemCount: upcoming.length,
                                    itemBuilder: (context,index) {
                                    final bursary = upcoming[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Card(
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
                                      SizedBox(height: 10),
                                      Text(bursary.bursary_name!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),),
                                      SizedBox(height: 3),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                        child: ElevatedButton(onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:(context) => Bursarydetailspage(bursaryId: bursary.id!),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        )
                                        ), child:Text("Check Eligibility",style: TextStyle(
                                        color: Colors.blueAccent,
                                        ),),),
                                      )
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
                                    );
                                    }

                                    )
                                    );


                                    }
                    ),
                    SizedBox(height: 5),
                   Card(

                     child: ListTile(
                       leading: Text("Upcoming Deadlines",
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w900,
                       ),),
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
                        final now = DateTime.now();
                        final today = DateTime(now.year,now.month,now.day);
                        final upcoming = bursaries.where((bursary){
                          final parsed = DateTime.parse(bursary.bursary_deadline!);
                          final deadline = DateTime(parsed.year,parsed.month,parsed.day);
                          final end = today.add(Duration(days: 30));
                          return !deadline.isBefore(today) && deadline.isBefore(end);
                        }).toList()
                         ..sort((a,b){
                          final dateA = DateTime.parse(a.bursary_deadline!);
                          final dateB = DateTime.parse(b.bursary_deadline!);
                          return dateA.compareTo(dateB);
                        });
                        return SizedBox(
                          height: 200,
                          child: upcoming.isEmpty ? Center(child: Text("No uploaded Bursaries yet"),): ListView.builder(
                            itemCount: upcoming.length,
                            itemBuilder: (context,index) {
                              final bursary = upcoming[index];
                              return Card(
                                child: ListTile(
                                  leading: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.blue.shade100,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(format_date(bursary.bursary_deadline!),
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
                    Consumer2<BursaryProvider,Favoriteservice>(
                      builder: (context,BursaryProvider,favService,child) {
                        final bursaries = BursaryProvider.all_bursaries;
                        final now = DateTime.now();
                        final today = DateTime(now.year,now.month,now.day);
                        final end = today.add(Duration(days: 30));
                         final trending_bursaries = bursaries.where((bursary){
                           final deadline = DateTime.parse(bursary.bursary_deadline!);
                           return deadline.year == now.year && deadline.month == now.month&&
                           !deadline.isBefore(DateTime(now.year,now.month,now.day));
                         }).toList();
                        return SizedBox(
                          height: 340,
                          child: trending_bursaries.isEmpty ? Center(child: Text("No uploaded bursaries yet"),) : ListView.builder(
                            itemCount: trending_bursaries.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index) {
                              final bursary = trending_bursaries[index];
                              return
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                      child: Container(
                                        color: Colors.white,
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Image.asset("Assets/need_of.jpeg",
                                              fit: BoxFit.cover,),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 6),
                                                  child: Text("Award",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w900,
                                                    ),),
                                                ),
                                                IconButton(onPressed: () async{
                                               await favService.toggle_favorite(bursary);

                                                },
                                                    icon: Icon(
                                                      Icons
                                                          .favorite_border_outlined,
                                                      color: bursary.isFavorite ? Colors.red : Colors.grey,))
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Text("${bursary.bursary_name} - ${bursary.bursary_amount}",
                                                style: TextStyle(
                                                  height: 1,
                                                  color: Colors.grey.shade500,
                                                ),),
                                            ),
                                            SizedBox(height: 9.0),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Text("Eligibility",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                ),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Text("${bursary.level_of_study} students",
                                                style: TextStyle(
                                                  color: Colors.grey.shade500,
                                                ),),
                                            ),
                                            SizedBox(height: 9),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 6),
                                              child: Wrap(
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
                                            ),
                                            SizedBox(height: 3.0),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Padding(
                                                padding: const EdgeInsets.all(9.0),
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
                                              ),
                                            )
                                          ],

                                        ),
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
                  ),
                    Consumer<BursaryProvider>(
                      builder: (context,BursaryProvider,child) {
                        final bursaries = BursaryProvider.all_bursaries;
                        final recommended = bursaries.where((bursary){
                          final now = DateTime.now();
                          final today = DateTime(now.year,now.month,now.day);
                          final recommended2 = bursary.isFavorite == true;
                          return recommended2;
                        }).toList();
                        return SizedBox(
                        height: 180,
                          child: recommended.isEmpty ? Center(child: Text("No uploaded bursaries yet"),): ListView.builder(
                            itemCount: recommended.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index) {
                                final bursary = recommended[index];
                                return Card(
                                    child: Container(
                                      color: Colors.white,
                                      width: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(bursary.bursary_name!,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),),
                                                IconButton(onPressed: () {},
                                                    icon: Icon(Icons.favorite,
                                                      color: Colors.red,))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("Amount",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),),
                                                Text(bursary.bursary_amount!,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("Eligibility",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),),
                                                Text(bursary.level_of_study!,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("Due Date",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),),
                                                Text(bursary.bursary_deadline!,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                  ),),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:(context) => Bursarydetailspage(bursaryId: bursary.id!),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(4.0),
                                                  ),
                                                  backgroundColor: Colors
                                                      .blueAccent,
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
                                    )
                                );
                              }),
                        );

                      }

                                      ),
            ]
                ),

              ),
        ),
            )
          )
        ),
      )
    );
  }
}
