import 'package:flutter/material.dart';
import 'package:bursary_inn/Services/AreaApiService.dart';
class Personaldetails extends StatefulWidget {
  const Personaldetails({super.key});

  @override
  State<Personaldetails> createState() => _PersonaldetailsState();
}

class _PersonaldetailsState extends State<Personaldetails> {
  List<String> courses = [
    "Computer Science",
    "Internation Relation"
  ];
  List<String> Genders = [
    "Male",
    "Female",
    "Prefer not to say"
  ];
  String? selectedGender;
  String? selectedCourse;

  Map<String,dynamic>? Areadata;
  List<String> counties = [];
  List<String> constituencies = [];
  List<String> wards = [];
  String? SelectedCounty;
  String? SelectedConstituency;
  String? SelectedWard;

  @override
  void initState(){
    super.initState();
    Areaapiservice().fetch_kenyan_areas().then((data){
      setState(() {
        Areadata = data;
        counties = data.keys.toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Details"),
        centerTitle: true,
      ),
      body:SafeArea(child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(child: Column(
                children: [
                  TextFormField(
                     decoration: InputDecoration(
                       labelText: "Name",
                       hintText: "John Doe",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                       ),
                     ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Registration Number",
                      hintText: "112223344",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "ID Number",
                      hintText: "112223344",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                    initialValue: selectedCourse,
                    items: courses.map((course){
                      return DropdownMenuItem(
                        value: course,
                          child: Text(course)
                      );
                    }).toList(),
                    onChanged: (newValue){
                      setState(() {
                        selectedCourse = newValue;
                      });
                    },
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please select a course';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Course",
                      hintText: "Education",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                    initialValue: selectedGender,
                    items:Genders.map((gender){
                      return DropdownMenuItem(
                        value: gender,
                          child: Text(gender));
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Gender",
                      hintText: "Male",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: SelectedCounty,
                    items: counties.map((county){
                      return DropdownMenuItem(
                        value: county,
                          child: Text(county)
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        SelectedCounty = value;
                        SelectedConstituency = null;
                        SelectedWard = null;
                        constituencies = Areadata![value]!.keys.toList();
                        wards = [];
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "County",
                      hintText: "Nairobi City",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: SelectedConstituency,
                    items: constituencies.map((c){
                      return DropdownMenuItem(
                          value: c,
                          child: Text(c));
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        SelectedConstituency = value;
                        SelectedWard = null;
                        wards = List<String>.from(Areadata![SelectedCounty]![value]!);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Constituency",
                      hintText: "Kasarani",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: SelectedWard,
                    items: wards.map((w){
                      return DropdownMenuItem(
                        value: w,
                          child: Text(w));
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        SelectedWard = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Ward",
                      hintText: "Clay City",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ))
            ],
          ),
        ),
      )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue.shade200,
              ),
              borderRadius: BorderRadius.circular(5),
            )
          ), child: Text("Save as Draft",
          style: TextStyle(
            color: Colors.blue.shade200
          ),),),
        ),
    );
  }
}
