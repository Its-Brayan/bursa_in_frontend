import 'package:flutter/material.dart';
class FAQs extends StatelessWidget {
   FAQs({super.key});
 final List<Map<String,String>> faqs = [
   {
     "question":"What is a bursary app?",
     "answer":"A Bursary Management System is a digital platform that helps institutions manage the entire bursary process—from application submission, document verification, and approval workflows to fund disbursement and reporting."
   },
   {
     "question":"Who can use the app?",
     "answer": "Applicants (Students) – Apply for bursaries and track status"
   },
   {
     "question":"How do students apply for a bursary?",
     "answer":" - Register and log in \n - Fill out the application form \n - Upload required documents \n - Submit the application"
   },
   {
     "question": "What documents are required during application?",
     "answer": "National ID / Passport \n - Academic transcripts \n - Admission letter \n - Proof of financial need \n - Recommendation letters"
   },
   {
     "question": "Can applicants edit their application after submission?",
     "answer": "- Before deadline: Yes, edits may be allowed \n - After submission/approval stage: Usually restricted to maintain integrity"
   },
   {
     "question" : " How are applications reviewed? ",
     "answer" : "- Initial screening (completeness check) \n - Document verification \n - Review by committee/admin \n - Final decision (approve/reject/waitlist)"
   },
   {
     "question": " How do users track application status?",
     "answer": " - Pending \n - Under Review \n - Approved \n - Rejected \n - Notifications (email or in-app) may also be sent."
   },
   {
     "question": " How are bursary funds disbursed?",
     "answer": " - Funds are allocated by administrators \n - Disbursement may be done via bank transfer, mobile money, or institution accounts \n - Records are stored for audit purposes"
   },
   {
     "question" : "Is the system secure?",
     "answer":" Yes, it includes: \n - User authentication and role-based access \n - Secure file uploads \n - Data encryption (where applicable) \n - Audit logs for tracking actions"
   },
   {
     "question":"What happens if an application is rejected?",
     "answer":" Applicants are notified and may: \n - View rejection reasons \n - Reapply in the next cycle (if allowed)"
   },
   {
     "question":"Can users reset their passwords?",
     "answer":"Yes, the system provides a secure password reset feature using email verification or OTP."
   },
   {
     "question":"How does the system handle notifications?",
     "answer":" - Email alerts \n - In-app notifications \n - SMS (optional integration)"
   }
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
      itemCount: faqs.length,
      itemBuilder: (context,index){
          return Card(
            child: ExpansionTile(title: Text(faqs[index]['question']!,
            style: TextStyle(fontWeight: FontWeight.w600),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(subtitle: Text(faqs[index]['answer']!),
                ))
              ],
            ),
          );
      }),
    );
  }
}
