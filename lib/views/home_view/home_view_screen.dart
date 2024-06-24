import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/constants.dart';
import 'package:sugar_mill_app/views/home_view/home_view_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../models/aadharData_model.dart';
import '../../router.router.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  // Helper function to create a button with an image and text
  Widget _buildImageButton({
    required String imagePath,
    required String buttonText,
    required Function onPressed,
  }) {
    return Material(
      color: Colors.white,
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Material(
          color: Colors.white,
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: 120,
                width: 300,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    maxFontSize: 15,
                    buttonText,
                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const AutoSizeText(
            'Venkateshwara Power Project',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Close the dialog
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            logout(context); // Close the dialog
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
         
        ),
        body: fullScreenLoader(
          loader: model.isBusy,
          context: context,
          child: WillPopScope(
            onWillPop: _onWillPop,
            child: SingleChildScrollView(
              child:  Hero(
                  tag: "TITLE",
                      child:Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/sugarcane_image.jpg')),
                            ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              model.dashboard.empName!=null ?
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Customize the shadow color and opacity
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3), // Customize the shadow offset
                                    ),
                                  ],
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model.greeting ?? "",
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  "${model.dashboard.empName.toString().toUpperCase()},",overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text( model.dashboard.lastLogType=="IN"?
                                                'Last Check-In at ${model.dashboard.lastLogTime.toString()}':"You're not check-in yet",
                                                  style: const TextStyle(fontSize: 16),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child:   ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                fit: BoxFit.fill,
                                                model.imageurl ?? "",
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: OutlinedButton(
                                          onPressed: () {
                                            String logtype= model.dashboard.lastLogType=="IN" ? "OUT" :"IN";
                                            Logger().i(logtype);
                                            model.employeeLog(logtype,context);
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            side: BorderSide(color:model.dashboard.lastLogType=="OUT" ? Colors.green:Colors.red,width: 2), // Set the border color
                                            minimumSize: const Size(150, 50), // Set the minimum button size
                                          ),
                                          child:model.isBusy == true ?LoadingAnimationWidget.hexagonDots(
                                            color:Colors.blueAccent,
                                            size: 18,
                                          ) :Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(model.dashboard.lastLogType=="OUT" ? 'assets/images/check-in.png':'assets/images/check-out.png',scale: 20),
                                              const SizedBox(width: 8),
                                              Text(model.dashboard.lastLogType=="OUT" ? 'Check-In':'Check-Out',style: TextStyle(color:model.dashboard.lastLogType=="OUT" ? Colors.green:Colors.red),),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                                  : const Center(
          child:  Card(
            color:Colors.white,
          elevation: 1,
          child: ListTile(
            leading: Icon(Icons.error,color: Colors.redAccent,size: 50),
          title: Text('Employee is not created for this user.\nPlease Contact to HR Admin.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),

          ),
        ), ),
    ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath: 'assets/images/farmer.jpg',
                                        buttonText: 'New Farmer',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addFarmerScreen,
                                            arguments:
                                                 AddFarmerScreenArguments(qrdata: aadharData(),
                                                    farmerid: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/farmer_list.jpg',
                                        buttonText: 'Farmer List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listFarmersScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/cane_registration.jpeg',
                                        buttonText: 'New Cane Registration',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addCaneScreen,
                                            arguments:
                                                const AddCaneScreenArguments(
                                                    caneId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/cane_list.jpg',
                                        buttonText: 'Cane Master List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listCaneScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/agri_developement.jpg',
                                        buttonText: 'New Cane Development',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addAgriScreen,
                                            arguments:
                                                const AddAgriScreenArguments(
                                                    agriId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/agri_list.jpg',
                                        buttonText: 'Cane Development List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listAgriScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                
                                    // Expanded(
                                    //   child: _buildImageButton(
                                    //     imagePath:
                                    //         'assets/images/crop_sampling.jpg',
                                    //     buttonText: 'New Crop Sampling',
                                    //     onPressed: () {
                                    //       Navigator.pushNamed(
                                    //         context,
                                    //         Routes.addCropSamplingScreen,
                                    //         arguments:
                                    //             const AddCropSamplingScreenArguments(
                                    //                 samplingId: ""),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    // const SizedBox(
                                    //   width: 15.0,
                                    // ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/crop_sample_list.jpg',
                                        buttonText: 'Crop Sampling List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.listSamplingScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              SizedBox(
                                height: getHeight(context) / 5,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/trip_sheet.webp',
                                        buttonText: 'New Trip Sheet',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.addTripsheetScreen,
                                            arguments:
                                                const AddTripsheetScreenArguments(
                                                    tripId: ""),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Expanded(
                                      child: _buildImageButton(
                                        imagePath:
                                            'assets/images/trip_list.jpg',
                                        buttonText: 'Trip Sheet List',
                                        onPressed: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.tripsheetMaster,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
              )

          ),
        ),
      ),),
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialise(context),
    );
  }
}
