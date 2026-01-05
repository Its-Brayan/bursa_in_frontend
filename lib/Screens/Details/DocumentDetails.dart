import 'package:bursary_inn/Providers/providers.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:provider/provider.dart';
import 'package:bursary_inn/Models/DetailsPage/DocumentDetails.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
class Documentdetails extends StatefulWidget {
  const Documentdetails({super.key});

  @override
  State<Documentdetails> createState() => _DocumentdetailsState();
}

class _DocumentdetailsState extends State<Documentdetails> {
  Future<File?> _openImageFile() async {
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
      return null;
    }

    // // if (context.mounted) {
    // //   await showDialog<void>(
    // //     context: context,
    // //     builder: (BuildContext context) => MultipleImagesDisplay(files),
    // //   );
    // }
    return File(files.first.path);

  }
  FileImage? selected_id_document;
  FileImage? selected_school_id;
  FileImage? selected_student_transcript;
  FileImage? selected_admission_letter;
  FileImage? selected_fee_structure;
  FileImage? selected_approval_letter;
  bool isLoading = false;

  void _previewimage(FileImage image){
    showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Column(
            children: [
              Image(image: image,fit: BoxFit.contain,
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Close",
              style: TextStyle(
                color: Colors.blue.shade200,
              ),))
            ],
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    final _documentprovider = Provider.of<DetailsPageProvider>(context);
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
                                child: selected_id_document != null ?
                                    GestureDetector(
                                      onTap:()=>_previewimage(selected_id_document!),
                                        child: Image(image: selected_id_document!,fit: BoxFit.cover,))
                                    :Icon(Icons.image,size: 50, color: Colors.grey,)
                             ),
                           ),
                           SizedBox(height: 1),
                           ElevatedButton.icon(onPressed: ()async{
                           File? picked= await _openImageFile();
                           if(picked != null){
                             setState(() {
                               selected_id_document = FileImage(picked);
                             });
                           }
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
                                child: selected_school_id != null ?
                                    GestureDetector(
                                      onTap: ()=>_previewimage(selected_school_id!),
                                        child: Image(image: selected_school_id!,fit: BoxFit.cover,))
                                    :Icon(Icons.image,size: 50,color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 1),
                            ElevatedButton.icon(onPressed: ()async{
                              File? picked =await _openImageFile();
                              if(picked!= null){
                                setState(() {
                                  selected_school_id = FileImage(picked);
                                });

                              }
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
                                  child: selected_student_transcript != null ?
                                      GestureDetector(
                                        onTap:(){
                                          _previewimage(selected_student_transcript!);
                                        },
                                          child: Image(image: selected_student_transcript!,fit: BoxFit.cover,))
                                      :Icon(Icons.image,size:50,color: Colors.grey,)
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: ()async{
                               File? picked =await _openImageFile();
                               if(picked != null){
                                 setState(() {
                                   selected_student_transcript = FileImage(picked);
                                 });

                               }
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
                                  child: selected_admission_letter != null ?
                                      GestureDetector(
                                        onTap: (){
                                          _previewimage(selected_admission_letter!);
                                        },
                                          child: Image(image: selected_admission_letter!,fit: BoxFit.cover,))
                                      :Icon(Icons.image,size: 50,color: Colors.grey),
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: ()async{
                                File? picked =await _openImageFile();
                                if(picked != null) {
                                  setState(() {
                                    selected_admission_letter =
                                        FileImage(picked);
                                  });
                                }
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
                                  child: selected_fee_structure != null ?
                                      GestureDetector(
                                        onTap:(){
                                          _previewimage(selected_fee_structure!);
                                        },
                                          child: Image(image: selected_fee_structure!,fit: BoxFit.cover))
                                      :Icon(Icons.image,size: 50,color: Colors.grey)
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: ()async{
                                File? picked = await _openImageFile();
                                if(picked != null) {
                                  setState(() {
                                    selected_fee_structure = FileImage(picked);
                                  });
                                }
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
                            child: selected_approval_letter != null ?
                                GestureDetector(
                                  onTap: ()=>_previewimage(selected_approval_letter!),
                                    child: Image(image: selected_approval_letter!,fit: BoxFit.cover))
                                :Icon(Icons.image,size: 50,color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 1),
                        ElevatedButton.icon(onPressed: ()async{
                          File? picked = await _openImageFile();
                          if(picked != null) {
                            setState(() {
                              selected_approval_letter = FileImage(picked);
                            });
                          }
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
        child: ElevatedButton(onPressed: ()async{
          startload();
        final documents = DocumentDetails(
          id_document: File(selected_id_document!.file.path),
          school_id: File(selected_school_id!.file.path),
          student_transcript:File(selected_student_transcript!.file.path),
          admission_letter:File(selected_admission_letter!.file.path),
          fee_structure: File(selected_fee_structure!.file.path),
          approval_letter:File(selected_approval_letter!.file.path),
        );
        final success = await _documentprovider.create_documents_details(documents);
        if(!success){
          print("failed to upload document details");
          return;
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
            description: Text("Document details Saved!"),
            title: Text("Update"),
          ).show(context);
          Navigator.pop(context);
        }
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
  startload()async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
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