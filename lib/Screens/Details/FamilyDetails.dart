import 'package:bursary_inn/Providers/providers.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bursary_inn/Models/DetailsPage/FamilyDetails.dart';
class Familydetails extends StatefulWidget {
  const Familydetails({super.key});

  @override
  State<Familydetails> createState() => _FamilydetailsState();
}

class _FamilydetailsState extends State<Familydetails> {
  List<String> answers = [
    "Only Father",
    "Only Mother",
    "Both",
    "No"
  ];
  List<String> feespayer = [
    "Father",
    "Mother",
    "Guardian",
    "Other"
  ];
  List<String> annual_family_income = [
    "1000 - 10,000",
    "10,000 - 50,000",
    "50,000 - 100,000",
    "100,000 - 500,000"
  ];
  List<String> general_answers = [
    "Yes",
    "No"
  ];
  String? selected_annual_family_income;
  String? selected_annual_family_expenses;
  String? selectedfeespayer;
  String? selectedanswer;
  String? selected_chronic_illness_answer;
  String? selected_parent_or_guardian_disability_answer;
  String? selected_parent_or_guardian_chronic_illness_answer;
  //Personal parent details
  TextEditingController fathers_name_Controller = TextEditingController();
  TextEditingController fathers_occupation_Controller = TextEditingController();
  TextEditingController mothers_name_Controller = TextEditingController();
  TextEditingController mothers_occupation_Controller = TextEditingController();
  TextEditingController chronic_illness_details_Controller = TextEditingController();
  TextEditingController parent_or_guardian_disability_detail_Controller = TextEditingController();
  TextEditingController parent_or_guardian_chronic_illness_details_Controller = TextEditingController();

  
  //Guardian Information
  TextEditingController guardians_name_Controller = TextEditingController();
  TextEditingController guardian_occupation_Controller = TextEditingController();

  //siblings information
  TextEditingController number_of_siblings_Controller = TextEditingController();
  TextEditingController number_of_siblings_working_Controller = TextEditingController();
  TextEditingController number_of_siblings_in_business_Controller = TextEditingController();
  TextEditingController number_o_fsiblings_in_college_Controller = TextEditingController();
  TextEditingController number_of_siblings_in_secondary_Controller = TextEditingController();

  //Income Information
  TextEditingController estimated_annual_family_income_Controller = TextEditingController();
  TextEditingController principal_source_Controller = TextEditingController();
  TextEditingController other_sources_Controller = TextEditingController();
  TextEditingController amount_spent_education_fees_Controller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isFetching = true;
@override
void initState(){
  super.initState();
  void refresh() => setState(() {});
  estimated_annual_family_income_Controller.addListener(refresh);
  principal_source_Controller.addListener(refresh);
  amount_spent_education_fees_Controller.addListener(refresh);
  WidgetsBinding.instance.addPostFrameCallback((_)async{
    final family = Provider.of<DetailsPageProvider>(context,listen: false);
    await family.get_student_family_details();
    final familyprovider = family.current_family_details;
    if(familyprovider != null){
      setState(() {


      fathers_name_Controller.text = familyprovider.fathers_name ?? "";
      fathers_occupation_Controller.text = familyprovider.fathers_occupation ?? "";
      mothers_name_Controller.text = familyprovider.mothers_name ?? "";
      mothers_occupation_Controller.text = familyprovider.mothers_occupation ?? "";
      guardians_name_Controller.text = familyprovider.guardian_name ?? "";
      guardian_occupation_Controller.text = familyprovider.guardian_occupation ?? "";
      selected_chronic_illness_answer = familyprovider.chronic_illness ?? "";
      selected_parent_or_guardian_disability_answer = familyprovider.parent_or_guardian_disability ?? "";
      parent_or_guardian_disability_detail_Controller.text = familyprovider.parent_or_guardian_disability_details ?? "";
      selected_parent_or_guardian_chronic_illness_answer = familyprovider.parent_or_guardian_chronic_illness ?? "";
      parent_or_guardian_chronic_illness_details_Controller.text = familyprovider.parent_or_guardian_chronic_illness_details ?? "";
      chronic_illness_details_Controller.text = familyprovider.chronic_illness_details ?? "";
      selectedanswer = familyprovider.parents_alive ?? "";
      selectedfeespayer = familyprovider.paying_fees ?? "";
      number_of_siblings_Controller.text = familyprovider.number_of_siblings ?? "";
      number_of_siblings_in_business_Controller.text = familyprovider.number_of_siblings_in_business ?? "";
      number_of_siblings_working_Controller.text = familyprovider.number_of_siblings_working ?? "";
      number_o_fsiblings_in_college_Controller.text = familyprovider.number_of_siblings_in_college ?? "";
      number_of_siblings_in_secondary_Controller.text = familyprovider.number_of_siblings_in_highschool ?? "";
      // estimated_annual_family_income_Controller.text = familyprovider.annual_family_income ?? "";
      selected_annual_family_income = familyprovider.annual_family_income ?? "";
      selected_annual_family_expenses = familyprovider.estimated_annual_family_expenses ?? "";
      principal_source_Controller.text = familyprovider.source_of_income ?? "";
      other_sources_Controller.text = familyprovider.other_income_sources ?? "";
      amount_spent_education_fees_Controller.text = familyprovider.amount_spent_on_fees ?? "";
      });
    }
    setState(() {
      isFetching = false;
    });
  });

}

  @override
  void dispose(){
    //Personal parent details
 fathers_name_Controller.dispose();
 fathers_occupation_Controller.dispose();
 mothers_name_Controller.dispose();
 mothers_occupation_Controller.dispose();
 

 //guardian details
 guardians_name_Controller.dispose();
 guardian_occupation_Controller.dispose();
 parent_or_guardian_chronic_illness_details_Controller.dispose();
 parent_or_guardian_disability_detail_Controller.dispose();
 chronic_illness_details_Controller.dispose();
 

    //siblings information
 number_of_siblings_Controller.dispose();
 number_of_siblings_working_Controller.dispose();
number_of_siblings_in_business_Controller.dispose();
number_o_fsiblings_in_college_Controller.dispose();
 number_of_siblings_in_secondary_Controller.dispose();

    //Income Information
 estimated_annual_family_income_Controller.dispose();
 principal_source_Controller.dispose();
 other_sources_Controller.dispose();
amount_spent_education_fees_Controller.dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final familyprovider = Provider.of<DetailsPageProvider>(context);
    return Scaffold(
    appBar: AppBar(
      title: Text("Family Details"),
      centerTitle: true,
    ),
      body: isFetching ? Center(child: CircularProgressIndicator(color: Colors.blue)) : Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: _formkey,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Family Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),),
                SizedBox(height: 5),
                TextFormField(
                  readOnly: familyprovider.current_family_details != null,
                  controller: fathers_name_Controller,
                decoration: InputDecoration(
                  labelText: "Father's Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
                ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: fathers_occupation_Controller,
                    decoration: InputDecoration(
                        labelText: "Father's Occupation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    controller: mothers_name_Controller,
                    decoration: InputDecoration(
                        labelText: "Mothers's Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: mothers_occupation_Controller,
                    decoration: InputDecoration(
                        labelText: "Mothers's Occupation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                     SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    controller: guardians_name_Controller,
                    decoration: InputDecoration(
                        labelText: "Guardian's Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                    SizedBox(height: 10),
                  TextFormField(
                    controller: guardian_occupation_Controller,
                    decoration: InputDecoration(
                        labelText: "Guardian's Occupation",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ), SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText:"Do you suffer from any chronic illness?*",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selected_chronic_illness_answer,
                      items: general_answers.map((answer){
                    return DropdownMenuItem(
                      value: answer,
                        child: Text(answer));
                  }).toList(), onChanged:familyprovider.current_family_details != null ? null : (value){
                    setState(() {
                      selected_chronic_illness_answer = value;
                    });
                  }
                  ),
                  SizedBox(height: 10),
                    TextFormField(
                      readOnly: familyprovider.current_family_details != null,
                    controller: chronic_illness_details_Controller,
                    validator: (value){
                      if (selected_chronic_illness_answer == "Yes" &&
                          (value == null || value.isEmpty)) {
                              return 'Please fill required detail';
                            }
                              return null;
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Chronic illness details?",
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText:"Are both parents alive?*",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selectedanswer,
                      items: answers.map((answer){
                    return DropdownMenuItem(
                      value: answer,
                        child: Text(answer));
                  }).toList(), onChanged:familyprovider.current_family_details != null ? null : (value){
                    setState(() {
                      selectedanswer = value;
                    });
                  }
                  ),
                   SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Do your parent(s)/guardian(s) have any form of disability?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selected_parent_or_guardian_disability_answer,
                      items: general_answers.map((answer){
                    return DropdownMenuItem(
                      value: answer,
                        child: Text(answer));
                  }).toList(), onChanged:familyprovider.current_family_details!= null ? null : (value){
                    setState(() {
                      selected_parent_or_guardian_disability_answer = value;
                    });
                  }
                  ),
                    SizedBox(height: 10),
                    TextFormField(
                      readOnly:familyprovider.current_family_details != null ,
                    controller: parent_or_guardian_disability_detail_Controller,
                    validator: (value){
                      if (selected_parent_or_guardian_disability_answer == "Yes" &&
                          (value == null || value.isEmpty)) {
                              return 'Please fill required detail';
                            }
                              return null;
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Parent/Guardian disability details?",
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      labelText: "Do your parent(s)/guardian(s) suffer from any chronic illness?*",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selected_parent_or_guardian_chronic_illness_answer,
                      items:general_answers.map((payer){
                    return DropdownMenuItem(
                      value: payer,
                        child: Text(payer));
                  }).toList(), onChanged: familyprovider.current_family_details != null ? null : (value){
                    setState(() {
                      selected_parent_or_guardian_chronic_illness_answer = value;
                    });
                  }),
                   SizedBox(height: 10),
                    TextFormField(
                      readOnly: familyprovider.current_family_details != null,
                    controller: parent_or_guardian_chronic_illness_details_Controller,
                    validator: (value){
                      if (selected_parent_or_guardian_chronic_illness_answer == "Yes" &&
                          (value == null || value.isEmpty)) {
                              return 'Please fill required detail';
                            }
                              return null;
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Parent(s)/Guardian(s) Chronic illness details?",
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      labelText: "Who has been paying fees?*",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selectedfeespayer,
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
                    readOnly: familyprovider.current_family_details != null,
                    keyboardType: TextInputType.number,
                    controller: number_of_siblings_Controller,
                    decoration: InputDecoration(
                        labelText: "How many siblings do you have(alive)?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    keyboardType: TextInputType.number,
                    controller: number_of_siblings_working_Controller,
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are working?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    keyboardType: TextInputType.number,
                    controller: number_of_siblings_in_business_Controller,
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are in business?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    keyboardType: TextInputType.number,
                    controller: number_o_fsiblings_in_college_Controller,
                    decoration: InputDecoration(
                        labelText: "How many of your siblings are in University/college",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    keyboardType: TextInputType.number,
                    controller: number_of_siblings_in_secondary_Controller,
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
                     DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      labelText: "Estimated annual family income",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selected_annual_family_income,
                      items:annual_family_income.map((payer){
                    return DropdownMenuItem(
                      value: payer,
                        child: Text(payer));
                  }).toList(), onChanged:familyprovider.current_family_details != null ? null : (value){
                    setState(() {
                      selected_annual_family_income = value;
                    });
                  }),
                  SizedBox(height: 10),
                   DropdownButtonFormField<String>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This field is required";
                        }
                        return null;
                      },
                    decoration: InputDecoration(
                      labelText: "Estimated annual family Expenses",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selected_annual_family_expenses,
                      items:annual_family_income.map((payer){
                    return DropdownMenuItem(
                      value: payer,
                        child: Text(payer));
                  }).toList(), onChanged:familyprovider.current_family_details != null ? null : (value){
                    setState(() {
                      selected_annual_family_expenses = value;
                    });
                  }),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field  is required";
                      }
                      return null;
                    },
                    controller: principal_source_Controller,
                    decoration: InputDecoration(
                        labelText: "Principal Source?*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    controller: other_sources_Controller,
                    decoration: InputDecoration(
                        labelText: "Other sources",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    readOnly: familyprovider.current_family_details != null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null ||value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: amount_spent_education_fees_Controller,
                    decoration: InputDecoration(
                        labelText: "Amount spent in education fees*",
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
                    color:(selectedanswer == null || selectedfeespayer == null || estimated_annual_family_income_Controller.text.isEmpty || principal_source_Controller.text.isEmpty || amount_spent_education_fees_Controller.text.isEmpty ) ? Colors.grey : Colors.blue.shade200,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                )
            ),
            onPressed: isLoading ? null : ()async{
               final isValid = _formkey.currentState?.validate() ?? false;
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

              final family = FamilyDetails(
                fathers_name: fathers_name_Controller.text,
                fathers_occupation: fathers_occupation_Controller.text,
                mothers_name: mothers_name_Controller.text,
                mothers_occupation: mothers_occupation_Controller.text,
                guardian_name: guardians_name_Controller.text,
                guardian_occupation: guardian_occupation_Controller.text,
                chronic_illness: selected_chronic_illness_answer,
                chronic_illness_details: chronic_illness_details_Controller.text,
                parent_or_guardian_disability: selected_parent_or_guardian_disability_answer,
                parent_or_guardian_disability_details: parent_or_guardian_disability_detail_Controller.text,
                parent_or_guardian_chronic_illness: selected_parent_or_guardian_chronic_illness_answer,
                parent_or_guardian_chronic_illness_details: parent_or_guardian_chronic_illness_details_Controller.text,
                parents_alive: selectedanswer,
                paying_fees: selectedfeespayer,
                number_of_siblings: number_of_siblings_Controller.text,
                number_of_siblings_working: number_of_siblings_working_Controller.text,
                number_of_siblings_in_business: number_of_siblings_in_business_Controller.text,
                number_of_siblings_in_college: number_o_fsiblings_in_college_Controller.text,
                number_of_siblings_in_highschool: number_of_siblings_in_secondary_Controller.text,
                annual_family_income: selected_annual_family_income,
                estimated_annual_family_expenses: selected_annual_family_expenses,
                source_of_income: principal_source_Controller.text,
                other_income_sources: other_sources_Controller.text,
                amount_spent_on_fees: amount_spent_education_fees_Controller.text,
              );
              setState(() {
                isLoading = true;
              });
              final success = familyprovider.current_family_details != null ?
                  await familyprovider.update_family_details(family) : await familyprovider.create_family_details(family);
              setState(() {
                isLoading = false;
              });
              if(!success){
                print("Failed registering family details");
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
                  description: Text("Successfully Registered family details"),
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
        :Text(familyprovider.current_family_details != null ? 'Update':'Submit',
          style: TextStyle(
            color:(selectedanswer == null || selectedfeespayer == null || selected_annual_family_income == null || selected_annual_family_expenses == null  || principal_source_Controller.text.isEmpty || amount_spent_education_fees_Controller.text.isEmpty ) ? Colors.grey : Colors.blue.shade200,
          ),)),
      ),
    );
  }

}
