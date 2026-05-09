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
  ImageProvider? selected_id_document;
  ImageProvider? selected_school_id;
  ImageProvider? selected_voters_card;
  ImageProvider? selected_student_transcript;
  ImageProvider? selected_admission_letter;
  ImageProvider? selected_fee_structure;
  ImageProvider? selected_death_certificate_father;
  ImageProvider? selected_death_certificate_mother;
  bool isLoading = false;
  bool isFetching = true;

  void _previewimage(ImageProvider image){
    showDialog(
        context: context,
        builder: (context) => Dialog(
          child: SingleChildScrollView(
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
          ),
        ));
  }
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      final documents = Provider.of<DetailsPageProvider>(context,listen: false);
      await documents.get_student_document_uploads();
      final documentprovider = documents.current_document_details;


          if(documentprovider != null) {
            setState(() {
            selected_id_document =
            documentprovider.idDocumentUrl != null ? NetworkImage(
                documentprovider.idDocumentUrl!) : null;
            selected_school_id =
            documentprovider.schoolIdUrl != null ? NetworkImage(
                documentprovider.schoolIdUrl!) : null;
                selected_voters_card != null ? NetworkImage(
                  documentprovider.votersCardUrl!) : null;
            selected_admission_letter =
            documentprovider.admissionLetterUrl != null ? NetworkImage(
                documentprovider.admissionLetterUrl!) : null;
            selected_student_transcript =
            documentprovider.studentTranscriptUrl != null ? NetworkImage(
                documentprovider.studentTranscriptUrl!) : null;
            selected_fee_structure =
            documentprovider.feeStructureUrl != null ? NetworkImage(
                documentprovider.feeStructureUrl!) : null;
            selected_death_certificate_father =
            documentprovider.deathCertificateFatherUrl != null ? NetworkImage(
                documentprovider.deathCertificateFatherUrl!) : null;
            selected_death_certificate_mother =
                documentprovider.deathCertificateMotherUrl != null ? NetworkImage(
                  documentprovider.deathCertificateMotherUrl!) : null;
            });
          }
          setState(() {
            isFetching = false;
          });

        });

  }
  @override
  Widget build(BuildContext context) {
    final documentprovider = Provider.of<DetailsPageProvider>(context);
    return Scaffold(
     appBar: AppBar(
       title: Text("Document Details"),
       centerTitle: true,
     ),
      body:isFetching ? Center(child: CircularProgressIndicator(color: Colors.blue)) : SafeArea(child: SingleChildScrollView(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:130,
                      width: 150,
                      child: Card(
                        color: Colors.white70,
                        elevation: 2,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             Text("National ID",
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
                      height:130,
                      width: 150,
                      child: Card(
                        color: Colors.white70,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("School ID",
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
                     SizedBox(width: 20),
                    SizedBox(
                      height:130,
                      width: 150,
                      child: Card(
                        color: Colors.white70,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text("Voters Card",
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
                                  child: selected_voters_card != null ?
                                      GestureDetector(
                                        onTap: ()=>_previewimage(selected_voters_card!),
                                          child: Image(image: selected_voters_card!,fit: BoxFit.cover,))
                                      :Icon(Icons.image,size: 50,color: Colors.grey),
                                ),
                              ),
                              SizedBox(height: 1),
                              ElevatedButton.icon(onPressed: ()async{
                                File? picked =await _openImageFile();
                                if(picked!= null){
                                  setState(() {
                                    selected_voters_card = FileImage(picked);
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
              Text("Additional Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              SizedBox(height: 10),
              Row(
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
                            Text("Death Certificate(Father)",
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
                                child: selected_death_certificate_father != null ?
                                    GestureDetector(
                                      onTap: ()=>_previewimage(selected_death_certificate_father!),
                                        child: Image(image: selected_death_certificate_father!,fit: BoxFit.cover))
                                    :Icon(Icons.image,size: 50,color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 1),
                            ElevatedButton.icon(onPressed: ()async{
                              File? picked = await _openImageFile();
                              if(picked != null) {
                                setState(() {
                                  selected_death_certificate_father = FileImage(picked);
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
                            Text("Death Certificate(Mother)",
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
                                child: selected_death_certificate_mother != null ?
                                GestureDetector(
                                    onTap: ()=>_previewimage(selected_death_certificate_mother!),
                                    child: Image(image: selected_death_certificate_mother!,fit: BoxFit.cover))
                                    :Icon(Icons.image,size: 50,color: Colors.grey),
                              ),
                            ),
                            SizedBox(height: 1),
                            ElevatedButton.icon(onPressed: ()async{
                              File? picked = await _openImageFile();
                              if(picked != null) {
                                setState(() {
                                  selected_death_certificate_mother = FileImage(picked);
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
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ElevatedButton(onPressed: isLoading ? null : ()async{
        final documents = DocumentDetails(
          id_document:  selected_id_document is FileImage
              ? File((selected_id_document! as FileImage).file.path)
              : null,
          school_id: selected_school_id is FileImage
              ? File((selected_school_id! as FileImage).file.path)
              : null,
              voters_card: selected_voters_card is FileImage
              ? File((selected_voters_card! as FileImage).file.path) : null,
          student_transcript:selected_student_transcript is FileImage
              ? File((selected_student_transcript! as FileImage).file.path)
              : null,
          admission_letter:selected_admission_letter is FileImage
              ? File((selected_admission_letter! as FileImage).file.path)
              : null,
          fee_structure: selected_fee_structure is FileImage
              ? File((selected_fee_structure! as FileImage).file.path)
              : null,
          death_certificate_father:selected_death_certificate_father is FileImage
              ? File((selected_death_certificate_father! as FileImage).file.path)
              : null,
          death_certificate_mother: selected_death_certificate_mother is FileImage
            ? File((selected_death_certificate_mother! as FileImage). file.path) :
              null,
        );
        setState(() {
          isLoading = true;
        });
        final success = documentprovider.current_document_details != null ?
            await documentprovider.update_document_details(documents) :
        await documentprovider.create_documents_details(documents);
        setState(() {
          isLoading = false;
        });
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
          ), child: Text(documentprovider.current_document_details != null ? 'Update' :'Submit',
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