import 'package:bursary_inn/Providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Models/DetailsPage/EducationDetails.dart';
import 'package:provider/provider.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
class Educationdetails extends StatefulWidget {
  const Educationdetails({super.key});

  @override
  State<Educationdetails> createState() => _EducationdetailsState();
}

class _EducationdetailsState extends State<Educationdetails> {
  bool isLoading = false;
  List<String> courses = [
    "Undergraduate",
    "Postgraduate",
    "Diploma",
    "Certificate"
  ];
  List<String> years = [
    "First year",
    "Second year",
    "Third year",
    "Fourth year"
  ];
  List<String> year_of_completion = [
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
  ];
  String? chosen_year_of_completion;
  String? chosen_year;
  String? chosencourse;
  final _formKey = GlobalKey<FormState>();
  TextEditingController name_of_institution_controller = TextEditingController();
  TextEditingController institution_postal_address_controller = TextEditingController();
  TextEditingController institution_tel_number_controller = TextEditingController();
  bool isFetching = true;
  @override
  void initState(){
    super.initState();
    void refresh() => setState(() {});
    name_of_institution_controller.addListener(refresh);
    institution_tel_number_controller.addListener(refresh);
    institution_postal_address_controller.addListener(refresh);
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      final education = Provider.of<DetailsPageProvider>(
          context, listen: false);
      await education.get_student_education_details();
      final educationprovider = education.current_education_details;
      if (educationprovider != null) {
        setState(() {
        name_of_institution_controller.text =
            educationprovider.name_of_institution ?? "";
        chosencourse = educationprovider.course_level ?? "";
        chosen_year = educationprovider.year_of_study ?? "";
        chosen_year_of_completion = educationprovider.year_of_completion ?? "";
        institution_postal_address_controller.text =
            educationprovider.institution_postal_address ?? "";
        institution_tel_number_controller.text =
            educationprovider.institution_tel_number ?? "";
        });
      }
      setState(() {
        isFetching = false;
      });
    });

  }
  @override
  void dispose(){
    super.dispose();
    name_of_institution_controller.dispose();
    institution_tel_number_controller.dispose();
    institution_postal_address_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final educationprovider = Provider.of<DetailsPageProvider>(context);
    return Scaffold(
     appBar: AppBar(
       title: Text("Education Details"),
       centerTitle: true,
     ),
      body: isFetching ? Center(child: CircularProgressIndicator(color: Colors.blue)) : SafeArea(child: SingleChildScrollView(
        child: Column(
          children:[
            Form(
              key: _formKey,
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    controller: name_of_institution_controller,
                    decoration: InputDecoration(
                        labelText: "Name of Institution*",
                        hintText: "Kenyatta University",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      labelText: "Course*",
                      hintText: "Undergraduate",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                      initialValue: chosencourse,
                      items: courses.map((course){
                        return DropdownMenuItem(
                            value: course,
                            child: Text(course));
                      }).toList(), onChanged: (value){
                        setState(() {
                          chosencourse = value;
                        });
                  }),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Year*",
                          hintText: "Year of Study",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                      initialValue: chosen_year,
                      items: years.map((year){
                        return DropdownMenuItem(
                            value: year,
                            child: Text(year));
                      }).toList(), onChanged: (value){
                    setState(() {
                      chosen_year = value;
                    });
                  }),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Year of completion*",
                          hintText: "Expecte year of completion",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                      initialValue: chosen_year_of_completion,
                      items: year_of_completion.map((completion){
                        return DropdownMenuItem(
                            value: completion,
                            child: Text(completion));
                      }).toList(), onChanged: (value){
                    setState(() {
                      chosen_year_of_completion = value;
                    });
                  }),
                  SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    controller: institution_postal_address_controller,
                    decoration: InputDecoration(
                        labelText: "Institution postal address*",
                        hintText: " 62157-00200",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    controller: institution_tel_number_controller,
                    decoration: InputDecoration(
                        labelText: "Institution Tel number*",
                        hintText: "11223344",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                ],
              ),
            )
            ),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(
             side: BorderSide(
               color:(name_of_institution_controller.text.isEmpty || chosencourse == null ||
                   chosen_year == null || chosen_year_of_completion == null ||
                   institution_postal_address_controller.text.isEmpty || institution_tel_number_controller.text.isEmpty) ? Colors.grey : Colors.blue.shade200,
             ),
             borderRadius: BorderRadius.circular(5.0),
           )
          ),
            onPressed: isLoading ? null : ()async{
            if(name_of_institution_controller.text.isEmpty || chosencourse == null ||
            chosen_year == null || chosen_year_of_completion == null ||
            institution_postal_address_controller.text.isEmpty || institution_tel_number_controller.text.isEmpty){
              return;
            }
            final education = EducationDetails(
              name_of_institution: name_of_institution_controller.text,
              course_level: chosencourse,
              year_of_study: chosen_year,
              year_of_completion: chosen_year_of_completion,
              institution_postal_address: institution_postal_address_controller.text,
              institution_tel_number: institution_tel_number_controller.text,
            );
            setState(() {
              isLoading = true;
            });
            final success = educationprovider.current_education_details != null ?
                await educationprovider.update_education_details(education) :
            await educationprovider.create_education_details(education);
            setState(() {
              isLoading = false;
            });
            if(!success){
              print("Failed creating education details");
              return;
            }else{
              ElegantNotification.success(
                width: 360,
                height: 100,
                isDismissable: true,
                stackedOptions: StackedOptions(
                  key: 'top',
                  type: StackedType.same,
                  itemOffset: const Offset(-5, -5),
                ),
                description: Text("Successfully Registered Education details"),
                title: Text("Update"),
              ).show(context);
              Navigator.pop(context);
            }
            }, child: isLoading ? SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        )
        : Text(educationprovider.current_education_details != null ? 'Update' : 'Submit',
        style: TextStyle(
          color:(name_of_institution_controller.text.isEmpty || chosencourse == null ||
              chosen_year == null || chosen_year_of_completion == null ||
              institution_postal_address_controller.text.isEmpty || institution_tel_number_controller.text.isEmpty) ? Colors.grey : Colors.blue.shade200,
        ),)),
      ),
    );
  }
}
