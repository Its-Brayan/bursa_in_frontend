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
  List<String> Disability_options = [
    "Yes",
    "No"
  ];
  List<String> received_bursary_options = [
    "Yes",
    "No"
  ];
  String? selectedGender;
  String? selectedDisability;
  String? selectedReceivedBursaryOption;
  String? selectedCourse;
  bool isLoading = false;
  Map<String,dynamic>? Areadata;
  List<String> counties = [];
  List<String> constituencies = [];
  List<String> wards = [];
  String? SelectedCounty;
  String? SelectedConstituency;
  String? SelectedWard;
  bool isFetching = true;
   final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController registrationController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  // TextEditingController disabilityController = TextEditingController();
  TextEditingController disabilitydetailsController = TextEditingController();
  TextEditingController receivedBursarydetailsController = TextEditingController();
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
      personal.clear_error_message();
      await personal.get_student_personal_details();
      final personalprovider = personal.current_personal_details;
      if(personalprovider != null){
        setState(() {
          nameController.text = personalprovider.full_name ?? "";
          registrationController.text = personalprovider.registration_number ?? "";
          idController.text = personalprovider.national_id_number ?? "";
          selectedGender = personalprovider.student_gender ?? "";
          courseController.text =  personalprovider.course_of_study ?? "";
          selectedDisability = personalprovider.Disability ?? " ";
          disabilitydetailsController.text = personalprovider.disability_details ?? " ";
          selectedReceivedBursaryOption = personalprovider.received_bursary ?? " ";
          receivedBursarydetailsController.text = personalprovider.received_bursary_details ?? " ";
          SelectedCounty = personalprovider.county ?? "";
          SelectedConstituency = personalprovider.constituency ?? "";
          SelectedWard = personalprovider.ward ?? "";
        });
      }
      setState(() {
        isFetching = false;
      });
    });
  }
  @override
  void dispose(){
    nameController.dispose();
    registrationController.dispose();
    idController.dispose();
    genderController.dispose();
    receivedBursarydetailsController.dispose();
    disabilitydetailsController.dispose();
    countyController.dispose();
    countyController.dispose();
    constituencyController.dispose();
    wardController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final detailprovider = Provider.of<DetailsPageProvider>(context);
    final bool isExisting = detailprovider.current_personal_details != null;
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Details"),
        centerTitle: true,
      ),
      body:isFetching? Center(child: CircularProgressIndicator(color: Colors.blue,)) :  SafeArea(child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                    child: TextFormField(
              
                      readOnly: isExisting,
                       decoration: InputDecoration(
                         labelText: "Full Name",
                         hintText: "John Doe",
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(5),
                         ),
                       ),
                      controller: nameController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    readOnly: isExisting,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: registrationController,
                    decoration: InputDecoration(
                      labelText: "School Registration Number/Admission number",
                      hintText: "112223344",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    readOnly: isExisting,
                    controller: idController,
                    decoration: InputDecoration(
                      errorText: detailprovider.errorMessage,
                      labelText: "ID Number",
                      hintText: "112223344",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
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
                  
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    initialValue: selectedDisability,
                    items:Disability_options.map((disability){
                      return DropdownMenuItem(
                    value: disability,
                    child: Text(disability));
                    }).toList(),
                    onChanged: detailprovider.current_document_details != null ? null 
                    : (value){
                      setState(() {
                        selectedDisability = value;
                      });
                    },
                    decoration: InputDecoration(
                  
                      labelText: "Do you have any Disability?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                   TextFormField(
                    readOnly: isExisting,
                    controller: disabilitydetailsController,
                    validator: (value){
                        if (selectedDisability == "Yes" &&
                        (value == null || value.isEmpty)) {
                      return 'Please fill disability details';
                    }
                    return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Disability Details",
                      hintText: "If yes please specify",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                   SizedBox(height: 20),
                   DropdownButtonFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    initialValue: selectedReceivedBursaryOption,
                    items:received_bursary_options.map((received){
                      return DropdownMenuItem(
                        value: received,
                          child: Text(received));
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        selectedReceivedBursaryOption = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Have you ever received Bursary from NGCDF?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                   SizedBox(height: 20),
                   TextFormField(
                    controller: receivedBursarydetailsController,
                    validator: (value){
                      if (selectedReceivedBursaryOption == "Yes" &&
                          (value == null || value.isEmpty)) {
                              return 'Please fill required detail';
                            }
                              return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Ever Recieved Bursary before?",
                      hintText: "If yes please specify the amount and when you received it",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
               
                    
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    initialValue: SelectedCounty,
                    items: counties.map((county){
                      return DropdownMenuItem(
                        value: county,
                          child: Text(county)
                      );
                    }).toList(),
                    onChanged:detailprovider.current_personal_details != null ? null : (value){
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    initialValue: SelectedConstituency,
                    items: constituencies.map((c){
                      return DropdownMenuItem(
                          value: c,
                          child: Text(c));
                    }).toList(),
                    onChanged:detailprovider.current_personal_details != null ? null : (value){
                      setState(() {
                        SelectedConstituency = value;
                        SelectedWard = null;
                        wards = List<String>.from(Areadata![SelectedCounty]![value]!);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Constituency",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    initialValue: SelectedWard,
                    items: wards.map((w){
                      return DropdownMenuItem(
                        value: w,
                          child: Text(w));
                    }).toList(),
                    onChanged: detailprovider.current_personal_details != null ? null : (value){
                      setState(() {
                        SelectedWard = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Ward",
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
          child: ElevatedButton(onPressed: isLoading ? null : ()async{
            final isValid = _formKey.currentState?.validate() ?? false;
            if(!isValid){
              ElegantNotification.error(
                width: 360,
                height: 100,
                isDismissable: true,
                stackedOptions: StackedOptions(
                    key: 'top',
                    type: StackedType.same,
                    itemOffset: const Offset(-5, -5)
                ),
                description: Text("Please fill all the required fields"),
                title: Text("Error"),
              ).show(context);
              return;
            }
            final person = PersonalDetails(
              full_name: nameController.text,
              registration_number: registrationController.text,
              national_id_number: idController.text,
              course_of_study: courseController.text,
              student_gender: selectedGender,
              Disability: selectedDisability,
              disability_details: disabilitydetailsController.text,
              received_bursary: selectedReceivedBursaryOption,
              received_bursary_details: receivedBursarydetailsController.text,
              county: SelectedCounty,
              constituency:SelectedConstituency,
              ward: SelectedWard,
            );
            setState(() {
              isLoading = true;
            });
            final success = detailprovider.current_personal_details != null ?
                await detailprovider.update_student_personal_details(person) :
            await detailprovider.create_personal_details(person);
            setState(() {
              isLoading = false;
            });
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
                color:(nameController.text.isEmpty || registrationController.text.isEmpty ||
                    idController.text.isEmpty || courseController.text.isEmpty || selectedGender == null
                    || selectedDisability == null || selectedReceivedBursaryOption == null ||  SelectedCounty == null || SelectedConstituency == null || SelectedWard == null) ? Colors.grey : Colors.blue.shade200,
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
            color:(nameController.text.isEmpty || registrationController.text.isEmpty ||
                idController.text.isEmpty || courseController.text.isEmpty || selectedGender == null
                ||selectedDisability == null || selectedReceivedBursaryOption == null ||  SelectedCounty == null || SelectedConstituency == null || SelectedWard == null) ? Colors.grey : Colors.blue.shade200
          ),),),
        ),
    );
  }

}
