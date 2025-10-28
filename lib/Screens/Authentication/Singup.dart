import 'package:flutter/material.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool show_password = false;
  bool show_password_confirm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Let's Get Started!",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("Create an account of bursain to\n          access all features")
            ),
            SizedBox(height: 30),
            Form(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Name",
                        suffixIcon: Icon((Icons.person)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email",
                        suffixIcon: Icon((Icons.email_outlined)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        suffixIcon: Icon((Icons.phone_android_rounded)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: !show_password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              show_password = !show_password;
                            });
                          },
                          child: Icon(
                              show_password ? Icons.visibility_off : Icons.visibility
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: !show_password_confirm,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              show_password_confirm = !show_password_confirm;
                            });
                          },
                          child: Icon(
                              show_password_confirm ? Icons.visibility_off : Icons.visibility
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child:Text("Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Wrap(
                    spacing: 4,
                    children: [
                      Text("Already have an account?"),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.pushNamed(context,"/login");
                            });

                          },
                          child: Text("Login",
                            style: TextStyle(
                                color: Colors.blue
                            ),))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
