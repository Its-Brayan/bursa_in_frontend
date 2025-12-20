import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
class Explorepage extends StatefulWidget {
  const Explorepage({super.key});

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Explore Bursaries",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  width: 350,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image.asset("Assets/need_of.jpeg",fit: BoxFit.cover,
                          width: double.infinity,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.grey.shade500,))),
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
                          Text("Ksh 5000 - Ksh 7000",style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                          Text("Kenyan Students",style: TextStyle(
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
                          Text("12/08/23",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),)
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){}, child: Text("Apply Now",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                        ),),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: 350,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image.asset("Assets/need_of.jpeg",fit: BoxFit.cover,
                            width: double.infinity,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.grey.shade500,))),
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
                          Text("Ksh 5000 - Ksh 7000",style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                          Text("Kenyan Students",style: TextStyle(
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
                          Text("12/08/23",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),)
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){}, child: Text("Apply Now",
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: 350,
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image.asset("Assets/need_of.jpeg",fit: BoxFit.cover,
                            width: double.infinity,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,color: Colors.grey.shade500,))),
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
                          Text("Ksh 5000 - Ksh 7000",style: TextStyle(
                            color: Colors.grey.shade500,
                          ),),
                          Text("Kenyan Students",style: TextStyle(
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
                          Text("12/08/23",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),)
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){}, child: Text("Apply Now",
                          style: TextStyle(
                            color: Colors.white,
                          ),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )
                          ),),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
