import 'package:flutter/material.dart';
class UpdateDetails extends StatefulWidget {
  const UpdateDetails({super.key});

  @override
  State<UpdateDetails> createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Details",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
      ),
      body: SafeArea(child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 2,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Preview",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text("Please check all the details carefully"),
                SizedBox(height: 15),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/personaldetails");
                  },
                  minTileHeight: 50,
                  title: Text("Personal details",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: GestureDetector(
                      onTap: (){

                   Navigator.pushNamed(context, "/personaldetails");


                      },
                      child: Icon(Icons.keyboard_arrow_right,color:Colors.blue,),),
                  tileColor:Colors.blue.shade100,

                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/familydetails");
                  },
                    minTileHeight: 50,
                    title: Text("Family details",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: GestureDetector(
                        onTap: (){
                         Navigator.pushNamed(context, "/familydetails");
                        },
                        child: Icon( Icons.keyboard_arrow_right,color: Colors.blue,)),
                    tileColor: Colors.blue.shade100

                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, '/educationdetails');
                  },
                    minTileHeight: 50,
                    title: Text("Education details",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/educationdetails');
                        },
                        child: Icon(Icons.keyboard_arrow_right,color:Colors.blue,)),
                    tileColor: Colors.blue.shade100,

                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, "/documentdetails");
                  },
                    minTileHeight: 50,
                    title: Text("Document details",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: GestureDetector(
                        onTap: (){
                        Navigator.pushNamed(context, "/documentdetails");
                        },
                        child: Icon(Icons.keyboard_arrow_right,color:Colors.blue,)),
                    tileColor:Colors.blue.shade100

                ),
              ],
            ),
          )


        ],

      )
      ),

    );
  }
}
