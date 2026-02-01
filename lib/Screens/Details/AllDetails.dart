import 'package:bursary_inn/Providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AllDetails extends StatefulWidget {
  const AllDetails({super.key});

  @override
  State<AllDetails> createState() => _AllDetailsState();
}

class _AllDetailsState extends State<AllDetails> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<DetailsPageProvider>(context,listen: false).check_completed_student_detail(context);

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final detailsprovider = Provider.of<DetailsPageProvider>(context);
    final sections = detailsprovider.filled_sections;
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
                    onTap: ()async{
                      if(sections['personal_filled'] == true){
                        return;
                      }
                      else {
                        await Navigator.pushNamed(context, "/personaldetails");
                        Provider.of<DetailsPageProvider>(context,listen: false).check_completed_student_detail(context);
                      }
                    },
                      child: Icon((sections['personal_filled'] ?? false) ? Icons.check_circle : Icons.keyboard_arrow_right,color: (sections['personal_filled'] ?? false) ? Colors.white : Colors.blue,)),
                  tileColor: (sections["personal_filled"] ?? false) ? Colors.green.shade400 : Colors.blue.shade100,

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
                      onTap: ()async{
                       if(sections['family_filled'] == true){
                         return;
                       }else {
                         await Navigator.pushNamed(context, "/familydetails");
                         Provider.of<DetailsPageProvider>(context,listen: false).check_completed_student_detail(context);
                       }
                      },
                      child: Icon((sections['family_filled'] ?? false) ? Icons.check_circle : Icons.keyboard_arrow_right,color: (sections['family_filled'] ?? false) ? Colors.white : Colors.blue,)),
                  tileColor: (sections["family_filled"] ?? false) ? Colors.green.shade400 : Colors.blue.shade100

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
                      onTap: ()async{
                        if(sections['education_filled'] == true){
                          return;
                        }else {
                         await Navigator.pushNamed(context, '/educationdetails');
                          Provider.of<DetailsPageProvider>(context,listen: false).check_completed_student_detail(context);
                        }
                      },
                      child: Icon((sections['education_filled'] ?? false) ? Icons.check_circle : Icons.keyboard_arrow_right,color: (sections['education_filled'] ?? false) ? Colors.white : Colors.blue,)),
                  tileColor:(sections["education_filled"] ?? false) ? Colors.green.shade400 : Colors.blue.shade100

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
                      onTap: ()async{
                        if(sections['documents_filled'] == true){
                          return;
                        }else{
                      await Navigator.pushNamed(context, "/documentdetails");
                      Provider.of<DetailsPageProvider>(context,listen: false).check_completed_student_detail(context);
                      }
                      },
                      child: Icon((sections['documents_filled'] ?? false) ? Icons.check_circle : Icons.keyboard_arrow_right,color: (sections['documents_filled'] ?? false) ? Colors.white : Colors.blue,)),
                  tileColor:(sections["documents_filled"] ?? false) ? Colors.green.shade400 : Colors.blue.shade100

                ),
              ],
            ),
          )


        ],

      )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          width: 150,
          child: ElevatedButton(onPressed: (){
            setState(() {
              if((sections['personal_filled'] ?? false) && (sections['family_filled'] ?? false) && (sections['education_filled'] ?? false) && (sections['documents_filled'] ?? false) == true) {
                Navigator.pushNamed(context, "/home");
                print("Navigating");

              }else {
                print("error navigating");
                return;
              }
            });
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: (sections['personal_filled'] ?? false) && (sections['family_filled'] ?? false) && (sections['education_filled'] ?? false) && (sections['documents_filled'] ?? false) ? Colors.blue : Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            ), child:Text("Continue",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          ),
        ),
      ),
    );
  }
}
