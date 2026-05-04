import 'package:flutter/material.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:provider/provider.dart';
class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();


}

class _NotificationpageState extends State<Notificationpage> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<BursaryProvider>(context,listen:false).get_applied_bursaries();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final Bursary_provier = Provider.of<BursaryProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Text("NOTIFICATION",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        bottom: TabBar(tabs: [
          Tab(text: "All",),
          Tab(text: "Unread"),
        ],
          automaticIndicatorColorAdjustment: true,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey.shade500,

        ),

      ),
        body: TabBarView(
            children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white24,
            child: Column(
              children: [
                Consumer<BursaryProvider>(
                  builder:(context,BursaryProvider,child) {
                    final bursaries = BursaryProvider.applied_bursaries;

                   return Expanded(
                     child: ListView.builder(
                     itemCount: bursaries.length,
                         itemBuilder: (context,index) {
                       final bursary = bursaries[index];
                           return Card(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(5.0),
                             ),
                             color: Colors.white,
                             child: ListTile(
                               leading: Image.asset("Assets/need_of.jpeg"),
                               title: Text(
                                 "${bursary['bursary_name']!} \n ${bursary['admin_message'] != null && bursary['admin_message'].toString().trim().isNotEmpty
                                     ? bursary['admin_message']
                                     : "Status: ${bursary['status_choices']}"}",
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 ),),
                               subtitle: Text( bursary['updated_date'],
                                 style: TextStyle(
                                   color: Colors.grey.shade500,
                                 ),),
                               trailing: bursary['is_read'] == false ? Container(
                                 width: 5,
                                 height: 5,
                                 decoration: BoxDecoration(
                                   color: Colors.blueAccent,
                                   shape: BoxShape.circle,
                                 ),
                               ) : null,
                             ),
                           );
                         }
                                        ),
                   );
                  }
                ),


              ],
            ),
          ),
        ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white24,
                  child: Column(
                    children: [
                      Consumer<BursaryProvider>(
                        builder: (context,BursaryProvider,child) {
                          final bursaries = BursaryProvider.applied_bursaries;
                          final filtered_bursaries = bursaries.where((bursary){
                            return bursary['is_read'] == false;
                          }).toList();
                         return filtered_bursaries.isEmpty ? Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("No unread Messages")
                             ],
                           ),
                         ) : Expanded(
                            child:  ListView.builder(
                              itemCount: filtered_bursaries.length,
                             itemBuilder: (context,index) {
                               final bursary = filtered_bursaries[index];
                               return  Card(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(5.0),
                                 ),
                                 color: Colors.white,
                                 child: ListTile(
                                   onTap: (){
                                     BursaryProvider.mark_as_read(bursary['id']);
                                   },
                                   leading: Image.asset("Assets/need_of.jpeg"),
                                   title: Text(

                                     "${bursary['bursary_name']!} \n ${bursary['admin_message'] != null && bursary['admin_message'].toString().trim().isNotEmpty
                                         ? bursary['admin_message']
                                         : "Status: ${bursary['status_choices']}"}",
                                     style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                     ),),
                                   subtitle: Text(bursary['updated_date'],
                                     style: TextStyle(
                                       color: Colors.grey.shade500,
                                     ),),
                                   trailing:bursary['is_read'] == false ? Container(
                                     width: 5,
                                     height: 5,
                                     decoration: BoxDecoration(
                                       color: Colors.blueAccent,
                                       shape: BoxShape.circle,
                                     ),
                                   ) : null,
                                 ),
                               );
                             }
                            ),
                          );
                        }
                      ),



                    ],
                  ),
                ),
              ),
          ]
      ),
      
      ),
    );
  }
}
