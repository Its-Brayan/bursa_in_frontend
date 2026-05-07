import 'package:bursary_inn/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
class Newpasswordscreen extends StatefulWidget {
  final String email;
  final String otp;
  Newpasswordscreen({super.key,required this.email,required this.otp});

  @override
  State<Newpasswordscreen> createState() => _NewpasswordscreenState();
}

class _NewpasswordscreenState extends State<Newpasswordscreen> {
  final TextEditingController passwordController = TextEditingController();

  bool hidepsw = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: passwordController,
              obscureText: !hidepsw,
              decoration: InputDecoration(hintText: "New Password",
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
                suffixIcon: GestureDetector(
                  child: Icon(hidepsw ? Icons.visibility_off : Icons.visibility),
                  onTap: (){
                 setState(() {
                   hidepsw = !hidepsw;
                 });
                  },
                )
              ),
              validator: (value){
                  if(value == null || value.isEmpty){
                    return"This field is required";
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
              SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final success = await UserService().reset_password(
                  email: widget.email,
                  otp: widget.otp,
                  password: passwordController.text,
                );
                setState(() {
                  isLoading = false;
                });
                if (success) {
                  toastification.show(
                    context: context,
                    alignment: Alignment.topRight,
                    description: Text("Successfully changed your password"),
                    type: ToastificationType.success,
                    style: ToastificationStyle.flat,
                    autoCloseDuration: Duration(seconds: 3),
                  );
                  Navigator.pushReplacementNamed(context, "/login");
                }else{
                  return;
                }
              },
              child: isLoading ?  SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.blue.shade200,
                ),
              ) : Text("Reset Password",style:TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50.0),
                backgroundColor: passwordController.text.isEmpty ? Colors.grey : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10.0)
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
