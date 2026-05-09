import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:bursary_inn/Services/BursaryService/BursaryApplicationService.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bursary_inn/Services/ApiService.dart';
import 'package:toastification/toastification.dart';
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
  final baseURL = "https://bursa-in-backend.onrender.com/api/v1/programs";
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
      body:Bursary == null ?
      Center(child: CircularProgressIndicator(
        color: Colors.blue,
      )) : SingleChildScrollView(
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
                    // Text("${Bursary?.level_of_study} Students",
                    //   style: TextStyle(
                    //       decoration: TextDecoration.underline,
                    //       fontSize: 17,
                    //       fontWeight: FontWeight.bold
                    //   ),),
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
            toastification.show(
              context: context, // optional if you use ToastificationWrapper
              type: ToastificationType.success,
              style: ToastificationStyle.flat,
              autoCloseDuration: const Duration(seconds: 5),
              title: Text('Success',
                style: TextStyle(
                  color: Colors.green,
                ),),
              // you can also use RichText widget for title and description parameters
              description: RichText(text: TextSpan(text: "You have successfully applied for ${Bursary?.bursary_name} bursary",
                  style:TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  )
              )),
              alignment: Alignment.topRight,

              animationDuration: const Duration(milliseconds: 200),
              icon: const Icon(Icons.check),
              showIcon: true, // show or hide the icon
              primaryColor: Colors.green,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x07000000),
                  blurRadius: 16,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                )
              ],
              showProgressBar: true,
              closeButton: ToastCloseButton(
                showType: CloseButtonShowType.onHover,
                buttonBuilder: (context, onClose) {
                  return OutlinedButton.icon(
                    onPressed: onClose,
                    icon: const Icon(Icons.close, size: 20),
                    label: const Text('Close'),
                  );
                },
              ),
              closeOnClick: false,
              pauseOnHover: true,
              dragToClose: true,
              applyBlurEffect: true,
            );
            Navigator.pop(context);
          }else{
            toastification.show(
              context: context, // optional if you use ToastificationWrapper
              type: ToastificationType.success,
              style: ToastificationStyle.flat,
              autoCloseDuration: const Duration(seconds: 5),
              title: Text('Failed',
                style: TextStyle(
                  color: Colors.red,
                ),),
              // you can also use RichText widget for title and description parameters
              description: RichText(text: TextSpan(text: 'You have already applied for ${Bursary?.bursary_name} bursary',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))),
              alignment: Alignment.topRight,

              animationDuration: const Duration(milliseconds: 200),
              icon: const Icon(Icons.error_outline),
              showIcon: true, // show or hide the icon
              primaryColor: Colors.red,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x07000000),
                  blurRadius: 16,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                )
              ],
              showProgressBar: true,
              closeButton: ToastCloseButton(
                showType: CloseButtonShowType.onHover,
                buttonBuilder: (context, onClose) {
                  return OutlinedButton.icon(
                    onPressed: onClose,
                    icon: const Icon(Icons.close, size: 20),
                    label: const Text('Close'),
                  );
                },
              ),
              closeOnClick: true,
              pauseOnHover: true,
              dragToClose: true,
              applyBlurEffect: true,
            );
          }
        },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            )
          ), child: Text("Apply Now",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        ),
      ),
      
    );
  }
}
