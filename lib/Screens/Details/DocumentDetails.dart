import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_selector/file_selector.dart';
class Documentdetails extends StatefulWidget {
  const Documentdetails({super.key});

  @override
  State<Documentdetails> createState() => _DocumentdetailsState();
}

class _DocumentdetailsState extends State<Documentdetails> {
  Future<void> _openImageFile(BuildContext context) async {
    // #docregion SingleOpen
    const jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: <String>['jpg', 'jpeg'],
      uniformTypeIdentifiers: <String>['public.jpeg'],
    );
    const pngTypeGroup = XTypeGroup(
      label: 'PNGs',
      extensions: <String>['png'],
      uniformTypeIdentifiers: <String>['public.png'],
    );
    final List<XFile> files = await openFiles(
      acceptedTypeGroups: <XTypeGroup>[jpgsTypeGroup, pngTypeGroup],
    );
    // #enddocregion MultiOpen
    if (files.isEmpty) {
      // Operation was canceled by the user.
      return;
    }
    if (context.mounted) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) => MultipleImagesDisplay(files),
      );
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Self Proof",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height:155,
                    width: 150,
                    child: Card(
                      color: Colors.white70,
                      elevation: 2,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           Text("Student\n Photograph",
                           style: TextStyle(
                             fontWeight: FontWeight.w800,
                             fontSize: 15,
                           ),),
                           SizedBox(height: 10.0),
                           SizedBox(
                             width: 85,
                             height: 30,
                             child: Card(
                               shape: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(4.0)
                               ),
                                child: Text("1 uploaded",
                                style: TextStyle(
                                  color: Colors.grey
                                ),),
                             ),
                           ),
                           SizedBox(height: 1),
                           ElevatedButton.icon(onPressed: (){
                            _openImageFile(context);
                           }, icon: Icon(Icons.add,
                           color: Colors.white,),
                             label: Text("Upload",
                             style: TextStyle(
                               color: Colors.white,
                             ),),
                           style: ElevatedButton.styleFrom(
                             minimumSize: Size(50, 30),
                             backgroundColor: Colors.blue.shade200,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(5.0)
                             )
                           ),)
                         ],
                       ),
                     ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height:155,
                    width: 150,
                    child: Card(
                      color: Colors.white70,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("School \n ID",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),),
                            SizedBox(height: 10.0),
                            SizedBox(
                              width: 85,
                              height: 30,
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0)
                                ),
                                child: Text("1 uploaded",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),),
                              ),
                            ),
                            SizedBox(height: 1),
                            ElevatedButton.icon(onPressed: (){
                                  _openImageFile(context);
                            }, icon: Icon(Icons.add,
                              color: Colors.white,),
                              label: Text("Upload",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(50, 30),
                                  backgroundColor: Colors.blue.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                  )
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:20),
              Text("Proof Of Education",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      height:155,
                      width: 150,
                      child: Card(
                        color: Colors.white70,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Student\n Transcript",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                ),),
                              SizedBox(height: 10.0),
                              SizedBox(
                                width: 85,
                                height: 30,
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  child: Text("1 uploaded",
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: (){
                                _openImageFile(context);
                              }, icon: Icon(Icons.add,
                                color: Colors.white,),
                                label: Text("Upload",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(50, 30),
                                    backgroundColor: Colors.blue.shade200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    )
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height:155,
                      width: 150,
                      child: Card(
                        color: Colors.white70,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Admission\n Letter",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                ),),
                              SizedBox(height: 10.0),
                              SizedBox(
                                width: 85,
                                height: 30,
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  child: Text("1 uploaded",
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: (){
                                 _openImageFile(context);
                              }, icon: Icon(Icons.add,
                                color: Colors.white,),
                                label: Text("Upload",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(50, 30),
                                    backgroundColor: Colors.blue.shade200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    )
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height:155,
                      width: 150,
                      child: Card(
                        color: Colors.white70,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Fee\n Structure",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                ),),
                              SizedBox(height: 10.0),
                              SizedBox(
                                width: 85,
                                height: 30,
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  child: Text("1 uploaded",
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: (){
                                 _openImageFile(context);
                              }, icon: Icon(Icons.add,
                                color: Colors.white,),
                                label: Text("Upload",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(50, 30),
                                    backgroundColor: Colors.blue.shade200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)
                                    )
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:15),
              Text("Proof Of Economic Background",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height:155,
                width: 150,
                child: Card(
                  color: Colors.white70,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Approval\nLetter(chief)",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),),
                        SizedBox(height: 10.0),
                        SizedBox(
                          width: 85,
                          height: 30,
                          child: Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0)
                            ),
                            child: Text("1 uploaded",
                              style: TextStyle(
                                  color: Colors.grey
                              ),),
                          ),
                        ),
                        SizedBox(height: 1),
                        ElevatedButton.icon(onPressed: (){
                          _openImageFile(context);
                        }, icon: Icon(Icons.add,
                          color: Colors.white,),
                          label: Text("Upload",
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(50, 30),
                              backgroundColor: Colors.blue.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ElevatedButton(onPressed: (){
          _openImageFile(context);
        },
          style: ElevatedButton.styleFrom(
           side: BorderSide(
             color: Colors.blue.shade200,
           ),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4.0)
            )
          ), child: Text("Save as Draft",
        style: TextStyle(
          color: Colors.blue,
        ),
        ),
        ),
      ),
    );
  }
}
/// Widget that displays a text file in a dialog
class MultipleImagesDisplay extends StatelessWidget {
  /// Default Constructor
  const MultipleImagesDisplay(this.files, {super.key});

  /// The files containing the images
  final List<XFile> files;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Gallery'),
      // On web the filePath is a blob url
      // while on other platforms it is a system path.
      content: Center(
        child: Row(
          children: <Widget>[
            ...files.map(
                  (XFile file) => Flexible(
                child: kIsWeb
                    ? Image.network(file.path)
                    : Image.file(File(file.path)),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}