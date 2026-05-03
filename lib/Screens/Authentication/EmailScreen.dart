import 'package:bursary_inn/Screens/Authentication/OTP.dart';
import 'package:bursary_inn/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
   @override
   void dispose(){
     emailController.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value){
                  setState(() {
                  });
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  suffixIcon: Icon(Icons.mail_outline_sharp),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                validator:(value){
                  if(value == null || value.isEmpty){
                    return "Email is required";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: ()async{
                if(emailController.text.isEmpty){
                  return;
                }
                startload();
                await UserService().sendOTP(emailController.text);
                toastification.show(
                  context: context,
                  type: ToastificationType.success,
                  style: ToastificationStyle.flat,
                  autoCloseDuration: Duration(seconds: 3),
                  alignment: Alignment.topRight,
                  description: Text("OTP sent to your Mail!"),
                );
                Navigator.push(context, MaterialPageRoute(builder: (_) => OTP(email: emailController.text)));
              }, child: Text("Send OTP",
              style: TextStyle(
                color: Colors.white,
              ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: emailController.text.isEmpty ? Colors.grey : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),)
            ],
          ),
        ),
      ),
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
