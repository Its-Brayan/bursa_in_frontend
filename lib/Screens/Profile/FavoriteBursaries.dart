import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Services/BursaryService/FavoriteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Favoritebursaries extends StatefulWidget {
  const Favoritebursaries({super.key});

  @override
  State<Favoritebursaries> createState() => _FavoritebursariesState();
}

class _FavoritebursariesState extends State<Favoritebursaries> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      await Provider.of<BursaryProvider>(context,listen: false).get_favorite_bursaries();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     automaticallyImplyLeading: true,
     title: Text("Favorite Bursaries"),
     centerTitle: true,
   ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<BursaryProvider>(
          builder:(context,BursaryProvider,child){
            final favourite_bursaries = BursaryProvider.favorite_bursaries;
            if(favourite_bursaries.isEmpty){
              return Center(child: Text("No favorite bursaries"),
              );
            }
            return ListView.builder(
              itemCount: favourite_bursaries.length,
                itemBuilder: (context,index){
              final favorite_bursary = favourite_bursaries[index];
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
                                child: IconButton(onPressed: ()async{

                                },
                                    icon: Icon(
                                        Icons.favorite_border_outlined,
                                        color:   Colors.red ))),
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
                          Text("${favorite_bursary['bursary_name']}", style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                          Text("Kenyan Students", style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Due Date:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                            Text("${favorite_bursary['bursary']['application_deadline']}",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Added on:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("${favorite_bursary['added_date']}",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),)
                        ],
                      ),

                    ],
                  ),
                ),
              );
            });
          }
            ),
      ),
    );
  }
}
