import 'package:flutter/material.dart';
class Activitypage extends StatefulWidget {
  const Activitypage({super.key});

  @override
  State<Activitypage> createState() => _ActivitypageState();
}

class _ActivitypageState extends State<Activitypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       title: Text("APPLIED BURSARIES"),
       centerTitle: true,
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        child: Image.asset("Assets/need_of.jpeg",
                        width: 170,
                        height: 150,
                        fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 40, 5,0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Kasarani NGCDF\n 2025 - 2026",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),),
                            Wrap(
                              spacing: 3,
                              children: [
                                Text("Award",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("Ksh 9000 - Ksh 12000",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),),
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,),
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

                        ElevatedButton(onPressed: (){}, child: Text("View Details",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue.shade200,
                            ),
                            borderRadius: BorderRadiusGeometry.circular(5.0),
                          )
                        ),),
                        ElevatedButton(onPressed: (){}, child: Text("Check Status",
                        style: TextStyle(
                          color: Colors.white,
                        ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                        ),)
                      ],
                    ),
                  )
                ],

              ),
              ),
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset("Assets/need_of.jpeg",
                              width: 170,
                              height: 150,
                              fit: BoxFit.contain),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 40, 5,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kasarani NGCDF\n 2025 - 2026",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              Wrap(
                                spacing: 3,
                                children: [
                                  Text("Award",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text("Ksh 9000 - Ksh 12000",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,),
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

                          ElevatedButton(onPressed: (){}, child: Text("View Details",
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue.shade200,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(5.0),
                                )
                            ),),
                          ElevatedButton(onPressed: (){}, child: Text("Check Status",
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),)
                        ],
                      ),
                    )
                  ],

                ),
              ),
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset("Assets/need_of.jpeg",
                              width: 170,
                              height: 150,
                              fit: BoxFit.contain),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 40, 5,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kasarani NGCDF\n 2025 - 2026",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              Wrap(
                                spacing: 3,
                                children: [
                                  Text("Award",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text("Ksh 9000 - Ksh 12000",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,),
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

                          ElevatedButton(onPressed: (){}, child: Text("View Details",
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue.shade200,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(5.0),
                                )
                            ),),
                          ElevatedButton(onPressed: (){}, child: Text("Check Status",
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),)
                        ],
                      ),
                    )
                  ],

                ),
              ),
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          child: Image.asset("Assets/need_of.jpeg",
                              width: 170,
                              height: 150,
                              fit: BoxFit.contain),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 40, 5,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kasarani NGCDF\n 2025 - 2026",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              Wrap(
                                spacing: 3,
                                children: [
                                  Text("Award",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text("Ksh 9000 - Ksh 12000",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,color: Colors.red,),
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

                          ElevatedButton(onPressed: (){}, child: Text("View Details",
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue.shade200,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(5.0),
                                )
                            ),),
                          ElevatedButton(onPressed: (){}, child: Text("Check Status",
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),)
                        ],
                      ),
                    )
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
