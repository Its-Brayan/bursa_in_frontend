import 'package:flutter/material.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:provider/provider.dart';
class Activitypage extends StatefulWidget {
  const Activitypage({super.key});

  @override
  State<Activitypage> createState() => _ActivitypageState();
}

class _ActivitypageState extends State<Activitypage> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    Provider.of<BursaryProvider>(context,listen: false).get_applied_bursaries();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       title: Text("APPLIED BURSARIES"),
       centerTitle: true,
     ),
      body: Consumer<BursaryProvider>(
        builder: (context,BursaryProvider,child){
          final applied_bursaries = BursaryProvider.applied_bursaries;
          if(applied_bursaries.isEmpty){
            return Center(
              child: Text("No applied bursaries yet"),
            );
          }
        return ListView.builder(
          itemCount: applied_bursaries.length,
          itemBuilder: (context,index) {
            final applied_bursary = applied_bursaries[index];
            return Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset("Assets/need_of.jpeg",
                            width: 170,
                            height: 150,
                            fit: BoxFit.contain),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 40, 5, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${applied_bursary['bursary_name']}\n 2025 - 2026",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),
                            Wrap(
                              spacing: 3,
                              children: [
                                Text("Award:", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("${applied_bursary['bursary_amount']}",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),),
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(onPressed: () {},
                          icon: Icon(
                            Icons.delete_outline_outlined, color: Colors.red,),
                          label: Text("Delete",
                            style: TextStyle(
                                color: Colors.red
                            ),),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),
                        ),

                        ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.blue.shade200,
                                ),
                                borderRadius: BorderRadiusGeometry.circular(
                                    5.0),
                              )
                          ), child: Text("View Details",
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),),),
                        ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ), child: Text("Check Status",
                            style: TextStyle(
                              color: Colors.white,
                            ),),)
                      ],
                    ),
                  )


                ],
              ),
            );
          }
          );

          }
          )
            );
  }
}
