import 'package:flutter/material.dart';
class AllDetails extends StatefulWidget {
  const AllDetails({super.key});

  @override
  State<AllDetails> createState() => _AllDetailsState();
}

class _AllDetailsState extends State<AllDetails> {
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
                      child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blue,)),
                  tileColor: Colors.blue.shade100,

                ),
                SizedBox(height: 15),
                ListTile(
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
                      child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blue,)),
                  tileColor: Colors.blue.shade100,

                ),
                SizedBox(height: 15),
                ListTile(
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
                      child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blue,)),
                  tileColor: Colors.blue.shade100,

                ),
                SizedBox(height: 15),
                ListTile(
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
                      child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blue,)),
                  tileColor: Colors.blue.shade100,

                ),
                SizedBox(height: 15),
                ListTile(
                  minTileHeight: 50,
                  title: Text("Bank details",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: GestureDetector(
                      onTap: (){
                      Navigator.pushNamed(context,"/bankdetails");
                      },
                      child: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.blue,)),
                  tileColor: Colors.blue.shade100,

                ),

              ],
            ),
          )


        ],

      )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: (){}, child:Text("Edit",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
              ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                      color: Colors.blue.shade200
                    )
                  )
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: (){}, child:Text("Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
