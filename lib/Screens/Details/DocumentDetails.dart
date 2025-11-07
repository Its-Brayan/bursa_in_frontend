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
        child: Column(
          children: [
            
          ],
        ),
      )),
    );
  }
}
