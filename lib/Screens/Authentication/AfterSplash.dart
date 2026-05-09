import 'package:flutter/material.dart';
class Aftersplash extends StatelessWidget {
  const Aftersplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0),
              child: Center(
                child: Image.asset("Assets/graduation_caps.png",
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("WELCOME TO\nBURSARY IN",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(onPressed:(){
                    Navigator.pushNamed(context, "/login");
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5.0),
                      )
                    ), child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  ),
                ),
            ),
            SizedBox(height: 12),
            Text("OR",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 3,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text("Signup",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
