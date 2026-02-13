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
  //Personal parent details
  TextEditingController fathers_name_Controller = TextEditingController();
  TextEditingController fathers_occupation_Controller = TextEditingController();
  TextEditingController mothers_name_Controller = TextEditingController();
  TextEditingController mothers_occupation_Controller = TextEditingController();

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
      fathers_name_Controller.text = familyprovider.fathers_name ?? "";
      fathers_occupation_Controller.text = familyprovider.fathers_occupation ?? "";
      mothers_name_Controller.text = familyprovider.mothers_name ?? "";
      mothers_occupation_Controller.text = familyprovider.mothers_occupation ?? "";
      selectedanswer = familyprovider.parents_alive ?? "";
      selectedfeespayer = familyprovider.paying_fees ?? "";
      number_of_siblings_Controller.text = familyprovider.number_of_siblings ?? "";
      number_of_siblings_in_business_Controller.text = familyprovider.number_of_siblings_in_business ?? "";
      number_of_siblings_working_Controller.text = familyprovider.number_of_siblings_working ?? "";
      number_o_fsiblings_in_college_Controller.text = familyprovider.number_of_siblings_in_college ?? "";
      number_of_siblings_in_secondary_Controller.text = familyprovider.number_of_siblings_in_highschool ?? "";
      estimated_annual_family_income_Controller.text = familyprovider.annual_family_income ?? "";
      principal_source_Controller.text = familyprovider.source_of_income ?? "";
      other_sources_Controller.text = familyprovider.other_income_sources ?? "";
      amount_spent_education_fees_Controller.text = familyprovider.amount_spent_on_fees ?? "";
    }
  });
}

  @override
  void dispose(){
    //Personal parent details
 fathers_name_Controller.dispose();
 fathers_occupation_Controller.dispose();
 mothers_name_Controller.dispose();
 mothers_occupation_Controller.dispose();

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
      body: Padding(
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
                  DropdownButtonFormField(

                    decoration: InputDecoration(
                      hintText:"Are both parents alive?*",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    initialValue: selectedanswer,
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
                      hintText: "Who has been paying fees?*",
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
                    keyboardType: TextInputType.number,
                    controller: number_of_siblings_Controller,
                    decoration: InputDecoration(
                        labelText: "How many siblings do you have?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
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
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: estimated_annual_family_income_Controller,
                    decoration: InputDecoration(
                        labelText: "Estimated annual income for the family?*",
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
            onPressed: ()async{
              if(selectedanswer == null || selectedfeespayer == null || estimated_annual_family_income_Controller.text.isEmpty || principal_source_Controller.text.isEmpty || amount_spent_education_fees_Controller.text.isEmpty ){
                return;
              }
              startload();
              final family = FamilyDetails(
                fathers_name: fathers_name_Controller.text,
                fathers_occupation: fathers_occupation_Controller.text,
                mothers_name: mothers_name_Controller.text,
                mothers_occupation: mothers_occupation_Controller.text,
                parents_alive: selectedanswer,
                paying_fees: selectedfeespayer,
                number_of_siblings: number_of_siblings_Controller.text,
                number_of_siblings_working: number_of_siblings_working_Controller.text,
                number_of_siblings_in_business: number_of_siblings_in_business_Controller.text,
                number_of_siblings_in_college: number_o_fsiblings_in_college_Controller.text,
                number_of_siblings_in_highschool: number_of_siblings_in_secondary_Controller.text,
                annual_family_income: estimated_annual_family_income_Controller.text,
                source_of_income: principal_source_Controller.text,
                other_income_sources: other_sources_Controller.text,
                amount_spent_on_fees: amount_spent_education_fees_Controller.text,
              );
              final success = familyprovider.current_family_details != null ?
                  await familyprovider.update_family_details(family) : await familyprovider.create_family_details(family);
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
            color:(selectedanswer == null || selectedfeespayer == null || estimated_annual_family_income_Controller.text.isEmpty || principal_source_Controller.text.isEmpty || amount_spent_education_fees_Controller.text.isEmpty ) ? Colors.grey : Colors.blue.shade200,
          ),)),
      ),
    );
  }
  startload()async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }
}
