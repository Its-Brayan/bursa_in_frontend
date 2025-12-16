import 'package:flutter/material.dart';
class Documentdetails extends StatefulWidget {
  const Documentdetails({super.key});

  @override
  State<Documentdetails> createState() => _DocumentdetailsState();
}

class _DocumentdetailsState extends State<Documentdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Document Details"),
       centerTitle: true,
     ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Text("Self Proof",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),

            ],
          ),
        ),
      )),
    );
  }
}
