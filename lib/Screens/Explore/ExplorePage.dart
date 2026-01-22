import 'package:bursary_inn/Providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:provider/provider.dart';
class Explorepage extends StatefulWidget {
  const Explorepage({super.key});

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<BursaryProvider>(context,listen: false).get_all_bursaries();
    }
    );
  }
  Widget build(BuildContext context) {
    final provider = Provider.of<BursaryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Explore Bursaries",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<BursaryProvider>(
          builder: (context,BursaryProvider,child) {
            final bursaries = BursaryProvider.all_bursaries;
            if (bursaries.isEmpty) {
              return Center(child: Text("No available bursaries"),
              );
            }
            return ListView.builder(
              itemCount: bursaries.length,
              itemBuilder: (context,index){
              final bursary = bursaries[index];
              return Card(
                child: SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image.asset(
                            "Assets/need_of.jpeg", fit: BoxFit.cover,
                            width: double.infinity,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.grey.shade500,))),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Award",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("Eligibility",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("${bursary.bursary_amount!}", style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                          Text("Kenyan Students", style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Due Date:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("${bursary.bursary_deadline}",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),)
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ), child: Text("Apply Now",
                            style: TextStyle(
                              color: Colors.white,
                            ),),),
                      )
                    ],
                  ),
                ),
              );
          }
            );
          }
        ),
      ),
    );
  }
}
