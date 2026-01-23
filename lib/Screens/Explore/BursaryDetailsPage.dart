import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:bursary_inn/Services/BursaryService/BursaryApplicationService.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';
class Bursarydetailspage extends StatefulWidget {
  final int bursaryId;
  const Bursarydetailspage({super.key,required this.bursaryId});

  @override
  State<Bursarydetailspage> createState() => _BursarydetailspageState();
}

class _BursarydetailspageState extends State<Bursarydetailspage> {
BursaryDetail? Bursary;

@override
void initState(){
  super.initState();
  fetch_bursary_details();
}
Future<void> fetch_bursary_details() async{
  final baseURL = "http://10.33.27.1:8000/api/v1/programs";
  final response = await ApiService.AuthorizedRequest(
      (token) => http.get(
        Uri.parse("$baseURL/bursarydetail/${widget.bursaryId}/"),
        headers: {
          "Content-Type":"application/json",
          "Authorization":"Bearer $token"
        }
  ),
  );
   if(response.statusCode == 200){
     setState(() {
       Bursary = BursaryDetail.fromJson(jsonDecode(response.body));
       print(Bursary);
     });
   }else{
     print("Error fetching bursary details ${response.body}");
   }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Bursary Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  children: [
                    Text("${Bursary?.bursary_name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bursary will be awarded to students who have filled all the details and uploaded necessary documents",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Bursary Amount",
                            style: TextStyle(
                              color: Colors.grey.shade400
                            ),
                              ),
                          Text("Deadline",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${Bursary?.bursary_amount}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        Text("${Bursary?.bursary_deadline}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Eligibility",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.underline,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("1. Students' transcript",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("2.Photocopy of students' National Identity Card ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("3. Photocopy of college / university ID card ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("4.Parents death certificate / burial permit ( mandatory for orphans) ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("5. Current fees structure",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("6.Admission letters",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ElevatedButton(onPressed: ()async{
          if (Bursary == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Bursary details not loaded yet")),
            );
            return;
          }

          final success = await BursaryApplicationService().apply_for_bursary(Bursary!.id!);
          if(success){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(success ? "${Bursary?.bursary_name} Bursary applied successfully" : "Failed to apply for the bursary")
              )
            );
            Navigator.pop(context);
          }
        }, child: Text("Apply Now",
        style: TextStyle(
          color: Colors.white
        ),
        ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            )
          ),
        ),
      ),
      
    );
  }
}
