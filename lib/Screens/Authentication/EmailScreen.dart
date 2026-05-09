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
              ElevatedButton(onPressed:isLoading  ? null : ()async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                setState(() {
                  isLoading = true;
                });
                try {
                  if (!mounted) {
                    return;
                  }
                  await UserService().sendOTP(emailController.text);
                  toastification.show(
                    context: context,
                    type: ToastificationType.success,
                    style: ToastificationStyle.flat,
                    autoCloseDuration: Duration(seconds: 3),
                    alignment: Alignment.topRight,
                    description: Text("OTP sent to your Mail!"),
                  );
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_) => OTP(email: emailController.text)));
                }
                catch (e) {
                  if (!mounted) return;
                  toastification.show(
                    context: context,
                    style: ToastificationStyle.flat,
                    type: ToastificationType.error,
                    description: Text("Email does not exist"),
                    autoCloseDuration: Duration(seconds: 3),
                  );
                } finally {
                  if (mounted) {
                    setState(() {
                      isLoading = false;
                    });
                  };
                }
              },child:isLoading ?
              SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.blue.shade200,
                ),
              ) : Text("Send OTP",
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


}
