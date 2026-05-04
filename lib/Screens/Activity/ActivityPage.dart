import 'package:bursary_inn/Screens/Explore/BursaryDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:bursary_inn/Services/BursaryService/FetchAppliedBursaries.dart';
import 'package:toastification/toastification.dart';
class Activitypage extends StatefulWidget {
  const Activitypage({super.key});

  @override
  State<Activitypage> createState() => _ActivitypageState();
}

class _ActivitypageState extends State<Activitypage> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    Provider.of<BursaryProvider>(context,listen: false).get_applied_bursaries();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       title: Text("APPLIED BURSARIES"),
       centerTitle: true,
     ),
      body: Consumer<BursaryProvider>(
        builder: (context,BursaryProvider,child){
          final appliedBursaries = BursaryProvider.applied_bursaries;
          if(appliedBursaries.isEmpty){
            return Center(
              child: Text("No applied bursaries yet"),
            );
          }
        return RefreshIndicator(
          onRefresh: () async{
            await BursaryProvider.get_applied_bursaries();
          },
          child: appliedBursaries.isEmpty ? Center(
            child: CircularProgressIndicator(color: Colors.blue),
          ) : ListView.builder(
            itemCount: appliedBursaries.length,
            itemBuilder: (context,index) {
              final appliedBursary = appliedBursaries[index];
              return Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset("Assets/need_of.jpeg",
                              width: 170,
                              height: 150,
                              fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 40, 5, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${appliedBursary['bursary_name']}\n 2025 - 2026",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),),
                              Wrap(
                                spacing: 3,
                                children: [
                                  Text("Award:", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text("${appliedBursary['bursary_amount']}",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),),
                                ],
                              ),
          
                              Chip(
                                backgroundColor: appliedBursary['status_choices'] == 'Approved' ? Colors.green : appliedBursary['status_choices'] == 'Rejected' ? Colors.red : Colors.orange ,
                                visualDensity: VisualDensity.compact,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                label: Text("${appliedBursary['status_choices']}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),),
                              )
          
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(onPressed: () async{
                            final success = await FetchAppliedBursaries().delete_applied_bursary(appliedBursary['id']);
                            if(success) {
                              toastification.show(
                                context: context, // optional if you use ToastificationWrapper
                                type: ToastificationType.success,
                                style: ToastificationStyle.flat,
                                autoCloseDuration: const Duration(seconds: 5),
                                title: Text('Success',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),),
                                // you can also use RichText widget for title and description parameters
                                description: RichText(text: TextSpan(text: "You have successfully deleted ${appliedBursary['bursary_name']} bursary",
                                    style:TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    )
                                )),
                                alignment: Alignment.topRight,
          
                                animationDuration: const Duration(milliseconds: 200),
                                icon: const Icon(Icons.check),
                                showIcon: true, // show or hide the icon
                                primaryColor: Colors.green,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x07000000),
                                    blurRadius: 16,
                                    offset: Offset(0, 16),
                                    spreadRadius: 0,
                                  )
                                ],
                                showProgressBar: true,
                                closeButton: ToastCloseButton(
                                  showType: CloseButtonShowType.onHover,
                                  buttonBuilder: (context, onClose) {
                                    return OutlinedButton.icon(
                                      onPressed: onClose,
                                      icon: const Icon(Icons.close, size: 20),
                                      label: const Text('Close'),
                                    );
                                  },
                                ),
                                closeOnClick: false,
                                pauseOnHover: true,
                                dragToClose: true,
                                applyBlurEffect: true,
                              );
                            }else{
                              toastification.show(
                                context: context, // optional if you use ToastificationWrapper
                                type: ToastificationType.success,
                                style: ToastificationStyle.flat,
                                autoCloseDuration: const Duration(seconds: 5),
                                title: Text('Failed',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),),
                                // you can also use RichText widget for title and description parameters
                                description: RichText(text: TextSpan(text: 'Failed to delete ${appliedBursary['bursary_name']} bursary',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ))),
                                alignment: Alignment.topRight,
          
                                animationDuration: const Duration(milliseconds: 200),
                                icon: const Icon(Icons.error_outline),
                                showIcon: true, // show or hide the icon
                                primaryColor: Colors.red,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x07000000),
                                    blurRadius: 16,
                                    offset: Offset(0, 16),
                                    spreadRadius: 0,
                                  )
                                ],
                                showProgressBar: true,
                                closeButton: ToastCloseButton(
                                  showType: CloseButtonShowType.onHover,
                                  buttonBuilder: (context, onClose) {
                                    return OutlinedButton.icon(
                                      onPressed: onClose,
                                      icon: const Icon(Icons.close, size: 20),
                                      label: const Text('Close'),
                                    );
                                  },
                                ),
                                closeOnClick: true,
                                pauseOnHover: true,
                                dragToClose: true,
                                applyBlurEffect: true,
                              );
                            }
                          },
                            icon: Icon(
                              Icons.delete_outline_outlined, color: Colors.red,),
                            label: Text("Delete",
                              style: TextStyle(
                                  color: Colors.red
                              ),),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),
                          ),
          
                          ElevatedButton(onPressed: () {
                            Navigator.push(context,
                              MaterialPageRoute(
                                builder:(context) => Bursarydetailspage(bursaryId: appliedBursary['bursary']),
                              ),
                            );
                          },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blue.shade200,
                                  ),
                                  borderRadius: BorderRadiusGeometry.circular(
                                      5.0),
                                )
                            ), child: Text("View Details",
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),),),
                       
                        ],
                      ),
                    )
          
          
                  ],
                ),
              );
            }
            ),
        );

          }
          )
            );
  }
}
