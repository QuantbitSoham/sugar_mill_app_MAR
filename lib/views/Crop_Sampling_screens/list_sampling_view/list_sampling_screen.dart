import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/cdrop_down_widget.dart';
import '../../../widgets/error_widget.dart';
import '../../../widgets/full_screen_loader.dart';
import 'list_sampling_model.dart';

class ListSamplingScreen extends StatelessWidget {
  const ListSamplingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListSamplingModel>.reactive(
      viewModelBuilder: () => ListSamplingModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const AutoSizeText('Crop Sampling'),
          // actions: [
          //   ElevatedButton(
          //       onPressed: () {
          //         Navigator.pushNamed(
          //           context,
          //           Routes.addCropSamplingScreen,
          //           arguments:
          //               const AddCropSamplingScreenArguments(samplingId: ""),
          //         );
          //       },
          //       child: const AutoSizeText('+Add Crop Sampling')),
          // ],
        ),
        body: fullScreenLoader(
          child: RefreshIndicator(
            onRefresh: model.refresh,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child:Row(
                        children: [
                          Expanded(
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Season',
                                ),
                                value: model.seasoncontroller.text,
                                hint: const Text('Select Season'),
                                items: model.seasonlist.map((val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: AutoSizeText(val),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  model.seasoncontroller.text = value ?? "";
                                  model.filterListBySeason(
                                      name: value);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                model.villagecontroller.text = value;
                                model.getListByvillagefarmernameFilter(
                                    village: value);
                              },
                              decoration: const InputDecoration(
                                labelText: 'Village',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                model.namecontroller.text = value;
                                model.getListByvillagefarmernameFilter(
                                    name: value);
                              },
                              decoration: const InputDecoration(
                                labelText: 'Farmer Name',
                              ),
                            ),
                          )
            
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey,
                  child: const ListTile(
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AutoSizeText(
                          'Village/route',
                          maxLines: 2,
                          style: TextStyle(color: Colors.white),
                        ),
                       AutoSizeText(
                          'Crop Variety',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    leading:AutoSizeText(
                      'Plot Number',
                       overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                    title: AutoSizeText(
                      'Farmer Name',
                      style: TextStyle(color: Colors.white),
                      minFontSize: 8,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         Expanded(
                          child: AutoSizeText(
                            'Average Brixs',
                              overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Plantation Date',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                       
                         
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                model.filtersamplingList.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: model.filtersamplingList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ListTile(
                                tileColor:const Color(0xFFD3E8FD),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AutoSizeText(
                                      model.filtersamplingList[index].route ?? '',
                                      maxLines: 2,
                                    ),
                                    AutoSizeText(
                                      model.filtersamplingList[index]
                                              .cropVariety ??
                                          '',
                                    ),
                                  ],
                                ),
                                leading:AutoSizeText(
                                  model.filtersamplingList[index]
                                      .id.toString(),
                                      minFontSize: 20,
                                ),
                               
                                title: AutoSizeText(
                                  model.filtersamplingList[index].growerName ?? '', maxLines: 2,minFontSize: 10,
                                ),
                                subtitle: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      model.filtersamplingList[index].averageBrix.toString(),maxLines: 2,
                                    ),
                               const SizedBox(width: 15),
                                    AutoSizeText(DateFormat('dd-MM-yyyy').format(DateTime.parse(model.filtersamplingList[index].plantattionRatooningDate ??
                                        '')),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  model.onRowClick(
                                      context, model.filtersamplingList[index]);
                                },
                              ),
                            );
                           
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.white, // Color of the line
                              thickness: 0, // Thickness of the line
                            );
                          },
                        ),
                      )
                    : customErrorMessage()
              ],
            ),
          ),
          context: context,
          loader: model.isBusy,
        ),

        // body: fullScreenLoader(
        //   context: context,
        //   loader: model.isBusy,
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: TextField(
        //           onChanged: model.filterList,
        //           decoration: const InputDecoration(
        //             labelText: 'Search',
        //             prefixIcon: Icon(Icons.search),
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         child: ListView.separated(
        //           itemCount: model.filteredList.length,
        //           itemBuilder: (context, index) {
        //             return ListTile(
        //               leading: SizedBox(
        //                 width: 120,
        //                 child: AutoSizeText(
        //                   model.filteredList[index].village ?? '',
        //                   maxLines: 2,
        //                 ),
        //               ),
        //               title: Text(
        //                 model.filteredList[index].supplierName ?? '',
        //                 style: const TextStyle(fontSize: 11),
        //               ),
        //               subtitle: Text(
        //                 model.filteredList[index].name ?? '',
        //                 style: const TextStyle(fontSize: 8),
        //               ),
        //               onTap: () {
        //                 // Handle row click here
        //                 // _onRowClick(context, filteredList[index]);
        //                 model.onRowClick(context, model.filteredList[index]);
        //               },
        //             );
        //           },
        //           separatorBuilder: (context, index) {
        //             return const Divider();
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
