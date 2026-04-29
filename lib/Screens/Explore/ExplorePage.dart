import 'package:bursary_inn/Providers/providers.dart';
import 'package:bursary_inn/Services/BursaryService/BursaryApplicationService.dart';
import 'package:flutter/material.dart';
import 'package:bursary_inn/Models/BursaryModel/BursaryDetail.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:bursary_inn/Services/BursaryService/FavoriteService.dart';
import 'dart:async';
class Explorepage extends StatefulWidget {
  const Explorepage({super.key});

  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<BursaryProvider>(context,listen: false).get_all_bursaries();
    }
    );
  }
  final TextEditingController _searchController = TextEditingController();
  String _query = "";
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BursaryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Explore Bursaries",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer2<BursaryProvider,Favoriteservice>(
          builder: (context,BursaryProvider,favService,child) {
            final bursaries = BursaryProvider.all_bursaries;
            final filteredBursaries = bursaries.where((bursary){
              final name = bursary.bursary_name?.toLowerCase() ?? "";
              return name.contains(_query.toLowerCase());
            }).toList();
            if (filteredBursaries.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 200),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 50, color: Colors.grey),
                        const SizedBox(height: 10),
                        Text(
                          _query.isEmpty
                              ? "No available bursaries"
                              : "No results for \"$_query\"",
                        ),

                        // 👇 ADD CLEAR BUTTON
                        if (_query.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _query = "");
                            },
                            child: const Text("Clear search"),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return RefreshIndicator(
              onRefresh: () async{
                await BursaryProvider.get_all_bursaries();
              },
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false) _debounce!.cancel();

                            _debounce = Timer(Duration(milliseconds: 500), () {
                              setState(() {
                                _query = value;
                              });
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search Bursaries',
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: filteredBursaries.length,
                      itemBuilder: (context,index){
                      final bursary = filteredBursaries[index];
                      return Card(
                        child: SizedBox(
                          width: 350,
                          child: Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Image.asset(
                                    "Assets/need_of.jpeg", fit: BoxFit.cover,
                                    width: double.infinity,),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: IconButton(onPressed: () async{
                                        await favService.toggle_favorite(bursary);
                                        },
                                            icon: Icon(
                                              Icons.favorite_border_outlined,
                                              color: bursary.isFavorite ? Colors.red : Colors.grey.shade400))),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(bursary.bursary_name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Award",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text("Eligibility",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(bursary.bursary_amount!, style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),),
                                  Text("Kenyan Students", style: TextStyle(
                                    color: Colors.grey.shade500,
                                  ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Due Date:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text("${bursary.bursary_deadline}",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),)
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(onPressed: () async{
                                  final success = await BursaryApplicationService().apply_for_bursary(bursary.id!);
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
                                       description: RichText(text: TextSpan(text: "You have successfully applied for ${bursary.bursary_name} bursary",
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
                                       description: RichText(text: TextSpan(text: 'You have already applied for ${bursary.bursary_name} bursary',
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
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      )
                                  ), child: Text("Apply Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),),),
                              )
                            ],
                          ),
                        ),
                      );
                              }
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
