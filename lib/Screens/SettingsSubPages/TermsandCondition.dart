import 'package:flutter/material.dart';
class TermsandCondition extends StatelessWidget {
  const TermsandCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Terms & Condition"),
       centerTitle: true,
     ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpansionTile(title: Text("Introduction"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("By using this application, you agree to comply with and be bound by these Terms & Conditions. If you do not agree, please do not use the app."),
                )
              ],),
              ExpansionTile(title: Text("Purpose of the App"),
                children: [
                ListTile(
                  subtitle: Text(" - Allow students to apply for bursaries \n - Manage application submissions and supporting documents \n - Enable tracking of application status\n - Facilitate communication between applicants and administrators"),

                )
                ],),
              ExpansionTile(title: Text("User Accounts"),
                children: [
                  ListTile(
                    subtitle: Text(" - Users must provide accurate and complete information during registration \n - You are responsible for maintaining the confidentiality of your login credentials \n - Any activity under your account is your responsibility"),

                  )
                ],),
              ExpansionTile(title: Text("Eligibility"),
                children: [
                  ListTile(
                    title: Text("To use this app, you must:"),
                    subtitle: Text(" - Be a student or applicant eligible for bursary programs \n - Provide valid identification and academic details \n - Meet specific bursary requirements where applicable"),

                  )
                ],),
              ExpansionTile(title: Text("Application Submission:"),
                children: [
                  ListTile(
                    subtitle: Text(" - All applications must be submitted through the app \n - Supporting documents must be clear, valid, and truthful \n - False information may lead to disqualification"),

                  )
                ],),
              ExpansionTile(title: Text("Document Requirements"),
                children: [
                  ListTile(
                    title: Text("Users may be required to upload:"),
                    subtitle: Text(" - Identification documents \n - Academic records \n - Any additional documents specified per bursary"),

                  )
                ],),
              ExpansionTile(title: Text("Prohibited Activities"),
                children: [
                  ListTile(
                    title: Text("Users must NOT:"),
                    subtitle: Text(" - Provide false information \n - Attempt to hack or disrupt the system \n - Upload malicious or harmful files \n - Misuse or duplicate accounts"),

                  )
                ],),
              ExpansionTile(title: Text("Application Decisions"),
                children: [
                  ListTile(
                    title: Text("Users must NOT:"),
                    subtitle: Text(" - Submission does not guarantee approval \n - All decisions are final unless otherwise stated by administrators \n - The organization reserves the right to approve or reject applications"),

                  )
                ],),
              ExpansionTile(title: Text("Limitation of Liability"),
                children: [
                  ListTile(
                    title: Text("The system is provided “as is.” We are not responsible for:"),
                    subtitle: Text(" - Technical interruptions \n - Data loss caused by user actions\n - External system failures (e.g., internet or device issues)"),

                  )
                ],),
            ],
          ),
        ),
      ),
    );
  }
}
