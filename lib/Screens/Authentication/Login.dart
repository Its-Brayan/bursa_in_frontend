import 'package:bursary_inn/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Models/UserModel.dart';
import 'package:provider/provider.dart';
import 'package:elegant_notification/elegant_notification.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState(){
    super.initState();
    void refresh() => setState((){});
    _emailController.addListener(refresh);
    _passwordController.addListener(refresh);
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
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
                        autovalidateMode:AutovalidateMode.onUnfocus,
                        validator:(value){
                          if(value == null || value.isEmpty){
                            return "Email is required";
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
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
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Password is required";
                          }
                          if(value.length < 8){
                            return "Minimum 8 characters";
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Include at least one uppercase letter';
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Include at least one lowercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Include at least one number';
                          }
                          if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                            return 'Include at least one special character';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUnfocus,
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(onPressed: () async{
                          if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                            return;
                          }
                          startload();
                          final user = UserModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          final success = await userprovider.login_student(user);
                          if(!success){
                            ElegantNotification.error(
                                width: 360,
                                height: 100,
                                isDismissable: true,
                                stackedOptions: StackedOptions(
                                  key: 'top',
                                  type: StackedType.same,
                                  itemOffset:const Offset(-5, -5),),
                                title: Text("Error"),
                                description: Text(userprovider.errorMessage!.toString())).show(context);

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
                            await UserService().check_student_details_completion_navigate(context);
                          }
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: _emailController.text.isEmpty || _passwordController.text.isEmpty ?Colors.grey : Colors.blue,
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
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }
}
