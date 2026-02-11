import 'package:flutter/material.dart';
import 'package:bursary_inn/Models/UserModel.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/stacked_options.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool show_password = false;
  bool show_password_confirm = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
            Form(
              key: _formkey,
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: "Full Name",
                        suffixIcon: Icon((Icons.person)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        suffixIcon: Icon((Icons.email_outlined)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    maxLength: 10,
                     keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: InputDecoration(
                        labelText: "Phone Number",
                        suffixIcon: Icon((Icons.phone_android_rounded)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This field is required";
                      }
                      if(value.length < 10){
                        return "Phone number must have 10 digits";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUnfocus,

                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
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
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return"This field is required";
                      }
                      if(value.length < 8){
                        return "Minimum 8 characters";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _confirmPasswordController,
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
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return"This field is required";
                      }
                      if(value.length < 8){
                        return "Minimum 8 characters";
                      }
                      if(value != _passwordController.text){
                        return "passwords do not match";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async{
                      startload();
                      final user = UserModel(
                        full_name: _nameController.text,
                        email: _emailController.text,
                        phone_number: _phoneController.text,
                        password: _passwordController.text,
                        confirm_password: _confirmPasswordController.text,

                      );
                    final success =  await userProvider.create_student(user);
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
                            description: Text(userProvider.errorMessage?.toString() ?? "an unkown error occurred")).show(context);
                      }else{
                        ElegantNotification.success(
                          width: 360,
                            height: 100,
                            isDismissable: true,
                            stackedOptions: StackedOptions(
                                key: 'top',
                              type: StackedType.same,
                              itemOffset: const Offset(-5, -5)
                            ),
                            description:Text("Registration Successful"),
                          title: Text("update"),
                        ).show(context);
                        print("Registration Successful");
                        Navigator.pushNamedAndRemoveUntil(context, '/alldetails', (Route<dynamic>route) => false);
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
                      :Text("Create Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
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
  startload() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }
}
