import 'package:flutter/material.dart';

class Educationdetails extends StatefulWidget {
  const Educationdetails({super.key});

  @override
  State<Educationdetails> createState() => _EducationdetailsState();
}

class _EducationdetailsState extends State<Educationdetails> {
  List<String> courses = [
    "Undegraduate",
    "Postgraduate",
    "Diploma"
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
  ];
  String? chosen_year_of_completion;
  String? chosen_year;
  String? chosencourse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Education Details"),
       centerTitle: true,
     ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children:[
            Form(child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name of Institution",
                        hintText: "Kenyatta University",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Course",
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
                      decoration: InputDecoration(
                          labelText: "Year",
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
                      decoration: InputDecoration(
                          labelText: "Year of completion",
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
                    decoration: InputDecoration(
                        labelText: "Institution postal address",
                        hintText: " 62157-00200",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Institution Tel number",
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
