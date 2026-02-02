import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Services/AreaApiService.dart';
import 'package:bursary_inn/Models/DetailsPage/PersonalDetails.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:provider/provider.dart';
class Personaldetails extends StatefulWidget {
  const Personaldetails({super.key});

  @override
  State<Personaldetails> createState() => _PersonaldetailsState();
}

class _PersonaldetailsState extends State<Personaldetails> {
  List<String> Genders = [
    "Male",
    "Female",
    "Prefer not to say"
  ];
  String? selectedGender;
  String? selectedCourse;
  bool isLoading = false;
  Map<String,dynamic>? Areadata;
  List<String> counties = [];
  List<String> constituencies = [];
  List<String> wards = [];
  String? SelectedCounty;
  String? SelectedConstituency;
  String? SelectedWard;
   final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController countyController = TextEditingController();
  TextEditingController constituencyController = TextEditingController();
  TextEditingController wardController = TextEditingController();


  @override
  void initState(){
    super.initState();
    Areaapiservice().fetch_kenyan_areas().then((data){
      setState(() {
        Areadata = data;
        counties = data.keys.toList();
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(!mounted){
        return;
      }
      final personal = Provider.of<DetailsPageProvider>(context,listen: false);
      await personal.get_student_personal_details();
      final personalprovider = personal.current_personal_details;
      if(personalprovider != null){
        setState(() {
          nameController.text = personalprovider.full_name ?? "";
          registrationController.text = personalprovider.registration_number ?? "";
          idController.text = personalprovider.national_id_number ?? "";
          genderController.text = personalprovider.student_gender ?? "";
          courseController.text =  personalprovider.course_of_study ?? "";
          SelectedCounty = personalprovider.county ?? "";
          SelectedConstituency = personalprovider.constituency ?? "";
          SelectedWard = personalprovider.ward ?? "";
        });
      }
    });
  }
  @override
  void dispose(){
    nameController.dispose();
    registrationController.dispose();
    idController.dispose();
    genderController.dispose();
    countyController.dispose();
    countyController.dispose();
    constituencyController.dispose();
    wardController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final detailprovider = Provider.of<DetailsPageProvider>(context);
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
              Form(
                key: _formKey,
                  child: Column(
                children: [
                  TextFormField(
                     decoration: InputDecoration(
                       labelText: "Name",
                       hintText: "John Doe",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(5),
                       ),
                     ),
                    controller: nameController,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: registrationController,
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
                    controller: idController,
                    decoration: InputDecoration(
                      labelText: "ID Number",
                      hintText: "112223344",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: courseController,
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
                    initialValue: SelectedCounty,
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
                    initialValue: SelectedConstituency,
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
                    initialValue: SelectedWard,
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
          child: ElevatedButton(onPressed: ()async{
            startload();
            final person = PersonalDetails(
              full_name: nameController.text,
              registration_number: registrationController.text,
              national_id_number: idController.text,
              course_of_study: courseController.text,
              student_gender: selectedGender,
              county: SelectedCounty,
              constituency:SelectedConstituency,
              ward: SelectedWard,
            );
            final success = await detailprovider.create_personal_details(person);
            if(!success){
              print("Failed registering personal details");
              return;
            }else{
              ElegantNotification.success(
                width: 360,
                  height: 100,
                  isDismissable: true,
                  stackedOptions: StackedOptions(
                      key: 'top',
                      type: StackedType.same,
                      itemOffset: const Offset(-5, -5)
                  ),
                  description: Text("Personal Details Saved!"),
                title: Text("Update"),
              ).show(context);
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.blue.shade200,
              ),
              borderRadius: BorderRadius.circular(5),
            )
          ), child: isLoading ?
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Colors.blue.shade200,
                  ),
                )
           : Text(detailprovider.current_personal_details != null ? 'Update' : "Submit",
          style: TextStyle(
            color: Colors.blue.shade200
          ),),),
        ),
    );
  }
  startload() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }
}
