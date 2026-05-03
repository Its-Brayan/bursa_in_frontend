import 'package:bursary_inn/Screens/Authentication/NewPasswordScreen.dart';
import 'package:bursary_inn/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart';
import 'package:verification_code_field/verification_code_field.dart';

class OTP extends StatefulWidget {
  final String email;
  const OTP({super.key,required this.email});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  String otpcode = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.blue;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Center(
              child: Text("OTP VERIFICATION",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23,
                letterSpacing: 1
              ),
              ),
            ),
            Center(child: Text("Enter the Otp sent to ${widget.email}"),
            ),
            SizedBox(height: 40),
        VerificationCodeField(
          onChanged: (value){
            otpcode = value;
          },
          tripleSeparated: true,
          codeDigit: CodeDigit.six,
          enabled: true,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.5),
          ),
          textStyle:
          const TextStyle(fontSize: 20, color: Colors.green),
        ),

            SizedBox(height: 25),

             SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()async{
                  if(otpcode.length < 6){
                    toastification.show(
                      description: Text("Enter complete OTP"),
                      type: ToastificationType.error,
                      style: ToastificationStyle.flat,
                      autoCloseDuration: Duration(seconds: 3),
                    );
                    return;
                  }
                  final success = await UserService().verify_otp(email: widget.email,
                      otp: otpcode);
                  if(success){
                   toastification.show(
                     context: context,
                     style: ToastificationStyle.flat,
                     type: ToastificationType.success,
                     description: Text("OTP verified"),
                     autoCloseDuration: Duration(seconds: 3),
                   );
                   Navigator.push(context, MaterialPageRoute(builder: (_) => Newpasswordscreen(email: widget.email, otp: otpcode)));
                  }else{
                    toastification.show(
                      context: context,
                      style: ToastificationStyle.flat,
                      type: ToastificationType.error,
                      description:Text("Invalid OTP"),
                      autoCloseDuration: Duration(seconds: 3),
                    );
                  }
                  
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ), child: Text(
                  "Verify",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                ),
              ),
            Row(
              children: [
                Spacer(),

        TextButton(onPressed: ()async{
          await UserService().sendOTP(widget.email);
          toastification.show(
            context: context,
            type: ToastificationType.success,
            style: ToastificationStyle.flat,
            title: Text("Success"),
            description: Text("OTP resent"),
            autoCloseDuration: Duration(seconds: 3),
          );
        }, child: Text("Resend OTP",
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),)),

              ],
            )
          ],
        ),
      )),
    );
  }

}
