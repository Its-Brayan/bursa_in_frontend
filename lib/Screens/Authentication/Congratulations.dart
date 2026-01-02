import 'package:flutter/material.dart';
class Congratulations extends StatelessWidget {
  const Congratulations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: Column(
       children: [
         Padding(
           padding: const EdgeInsets.fromLTRB(10, 140, 10, 0),
           child: Center(
             child: Image.asset("Assets/celebration3.png",
             width: 650,),
           ),
         ),
         SizedBox(height: 30),
         Text("Congratulations!",
         style: TextStyle(
           fontWeight: FontWeight.w900,
           fontSize: 30,
         ),
         ),
         SizedBox(height: 10),
         Text("Almost there, just a few more steps\n to Reach your dream scholarship",
         style: TextStyle(
           fontWeight: FontWeight.w700,
         ),)
       ],
     )
     ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/alldetails');
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            backgroundColor: Colors.blue,
          ), child: Text("Get Started",
          style: TextStyle(
            color: Colors.white,
          ),),),
        ),
      ),
    );
  }
}
