import 'package:flutter/material.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Models/UserModel.dart';
import 'package:provider/provider.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool show_password = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final _userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Welcome Back!",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Center(child: Text("Login to your existing account of BursaIn",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),

                ),
                ),
                SizedBox(height: 100),
                Form(
                  key: _formkey,
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email_outlined,size: 16),
                            label: Text("Email Address",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !show_password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  show_password = !show_password;
                                });
                              },
                              child: Icon( show_password ?  Icons.visibility_off : Icons.visibility)),
                          label: Text("Password"),

                        ),
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(onPressed: () async{
                          startload();
                          final user = UserModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          final success = await _userprovider.login_student(user);
                          if(!success){
                            print("Login failed");
                            return;
                          }
                          else {
                            ElegantNotification.success(
                              width: 360,
                                height: 100,
                                isDismissable: true,
                                stackedOptions: StackedOptions(
                                    key: 'top',
                                type: StackedType.same,
                                itemOffset:const Offset(-5, -5),),
                                title: Text("Update"),
                                description: Text("Login Successful")).show(context);
                            print("Login Successful");
                            Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route)=>false);
                          }
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                          ), child:isLoading ? SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              color: Colors.blue.shade200,
                            ),
                          )
                         :Text("Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ),
                      ),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(onPressed: (){}, child:Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.blue
                            ),)
                          ),
                        ],
                      ),
                      // SizedBox(height: 5),
                      Text("OR",style: TextStyle(
                          fontSize: 15
                      ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 4,
                          child: ListTile(
                            onTap: (){

                            },
                            tileColor: Colors.grey.shade200,
                            leading: Image.asset("Assets/google_logo.png",
                              width: 50,
                              height: 50,
                            ),
                            title: Text("Continue with Google",
                              style: TextStyle(
                                fontSize: 16,
                              ),),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:20),
                      Wrap(
                        spacing: 5,
                        children: [
                          Text("Don't have an account?"),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Navigator.pushNamed(context, "/signup");
                              });

                            },
                            child: Text("SignUp",
                              style: TextStyle(
                                color: Colors.blue,
                              ),),
                          )
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
