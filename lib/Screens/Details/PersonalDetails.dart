import 'package:flutter/material.dart';
import 'package:universal_stepper/universal_stepper.dart';
import 'package:bursary_inn/Screens/Details/dotted_line_painer.dart';
import 'package:bursary_inn/Screens/Details/stepper_data.dart';

class Personaldetails extends StatefulWidget {
  const Personaldetails({super.key});

  @override
  State<Personaldetails> createState() => _PersonaldetailsState();
}

class _PersonaldetailsState extends State<Personaldetails> {
  int currentStep = 0;

  StepperBadgePosition badgePosition =
      StepperBadgePosition.center; // Set the desired badgePosition

  bool isInverted = false;

  List<StepperData> stepperData = [
    const StepperData(
      title: "Personal\nDetails",
      subtitle: "",

    ),
    const StepperData(
      title: "Family\nDetails",
      subtitle: "",
    ),
    const StepperData(
      title: "Education\nDetails",
      subtitle: "",
    ),
    const StepperData(
      title: "Documents",
      subtitle: "",
    ),
    const StepperData(
      title: "Bank\nDetails",
      subtitle: "",
    )
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: true,
        title: Text("Details",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: UniversalStepper(
                  inverted: true,
                  stepperDirection: Axis.horizontal,
                  elementBuilder: (context, index) {
                    return Container(
                      width: 130,
                      padding: const EdgeInsets.only(bottom: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            stepperData[index].title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                          if (stepperData[index].subtitle!.isNotEmpty)
                            Text(
                              stepperData[index].subtitle!,
                              textAlign: TextAlign.center,
                            ),
                        ],
                      ),
                    );
                  },
                  badgeBuilder: (context, index) {
                    return Container(
                      width: 30,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.all(Radius.circular(30))),
                      child:  FittedBox(
                          child: Icon( currentStep==0 ?Icons.person : currentStep == 1 ? Icons.person_3 : currentStep == 2 ? Icons.school_outlined : currentStep == 3 ? Icons.article_outlined : currentStep == 4 ? Icons.account_balance_outlined : null, color: Colors.white)),
                    );
                  },
                  pathBuilder: (context, index) {
                    return badgePosition == StepperBadgePosition.center
                        ? CustomPaint(
                      painter: DottedLinePainter(
                        color: index == 0
                            ? Colors.transparent
                            : (index <= currentStep
                            ? Colors.blue
                            : Colors.white),
                      ),
                    )
                        : badgePosition == StepperBadgePosition.start
                        ? CustomPaint(
                      painter: DottedLinePainter(
                        color: index == stepperData.length - 1
                            ? Colors.transparent
                            : (index < currentStep
                            ? Colors.blue
                            : Colors.white),
                      ),
                    )
                        : CustomPaint(
                      painter: DottedLinePainter(
                        color: index < currentStep
                            ? Colors.blue
                            : Colors.white,
                      ),
                    );
                  },
                  subPathBuilder: (context, index) {
                    return CustomPaint(
                      painter: DottedLinePainter(
                        color: index == stepperData.length - 1
                            ? Colors.transparent
                            : (index < currentStep
                            ? Colors.green
                            : Colors.white),
                      ),
                    );
                  },
                  elementCount: stepperData.length,
                  badgePosition: badgePosition,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(onPressed: (){
            if(currentStep >= 0) {
              setState(() {
                  currentStep++;
              });
            }
          }, child:Text("Save Draft",
          style: TextStyle(
            color: Colors.blue.shade200,
          ),
          ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              side: BorderSide(
                color: Colors.lightBlueAccent,
              )
            ),
          ),
          ElevatedButton(onPressed: (){}, child:Text("Save Draft",
            style: TextStyle(
              color: Colors.blue.shade200,
            ),
          ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: BorderSide(
                  color: Colors.lightBlueAccent,
                )
            ),
          )
        ],
      ),
    );
  }
}
