import 'package:flutter/material.dart';
class Familydetails extends StatefulWidget {
  const Familydetails({super.key});

  @override
  State<Familydetails> createState() => _FamilydetailsState();
}

class _FamilydetailsState extends State<Familydetails> {
  List<String> answers = [
    "Yes",
    "No"
  ];
  List<String> feespayer = [
    "Father",
    "Mother",
    "Guardian",
    "Other"
  ];
  String? selectedfeespayer;
  String? selectedanswer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Family Details"),
      centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Personal Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),),
                SizedBox(height: 5),
                TextFormField(
                decoration: InputDecoration(
                  labelText: "Father's Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
                ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Father's Occupation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Mothers's Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Mothers's Occupation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText:"Are both parents alive?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    value: selectedanswer,
                      items: answers.map((answer){
                    return DropdownMenuItem(
                      value: answer,
                        child: Text(answer));
                  }).toList(), onChanged:(value){
                    setState(() {
                      selectedanswer = value;
                    });
                  }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: "Who has been paying fees",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    value: selectedfeespayer,
                      items:feespayer.map((payer){
                    return DropdownMenuItem(
                      value: payer,
                        child: Text(payer));
                  }).toList(), onChanged: (value){
                    setState(() {
                      selectedfeespayer = value;
                    });
                  }),
                  SizedBox(height: 25),
                  Text("Siblings Information",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "How many siblings do you have?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are working?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are in business?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are in University/college",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are in Secondary school?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 25),
                  Text("Income Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Estimated annual income for the family?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Principal Source?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Other sources",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Amount spent in education fees",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),

                ],
              ))
            ],
          ),
        )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue.shade200,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                )
            ),
            onPressed: (){}, child: Text("Save as Draft",
          style: TextStyle(
            color: Colors.blue.shade200,
          ),)),
      ),
    );
  }
}
