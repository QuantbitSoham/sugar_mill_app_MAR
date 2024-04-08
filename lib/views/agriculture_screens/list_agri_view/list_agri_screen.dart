import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/agriculture_screens/list_agri_view/list_agri_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../../router.router.dart';
import '../../../widgets/cdrop_down_widget.dart';
import '../../../widgets/error_widget.dart';

class ListAgriScreen extends StatelessWidget {
  const ListAgriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListAgriModel>.reactive(
      viewModelBuilder: () => ListAgriModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const AutoSizeText('Agriculture Development List'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addAgriScreen,
                    arguments: const AddAgriScreenArguments(agriId: ""),
                  );
                },
                child: const AutoSizeText('+Add Cane Development')),
          ],
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
                      child: Row(
                        children: [
                          Expanded(
                            child: CdropDown(
                              dropdownButton: DropdownButtonFormField<String>(
                                isExpanded: true,
                                // Replace null with the selected value if needed
                                decoration: const InputDecoration(
                                  labelText: 'Season',
                                ),
                                hint: const Text('Select Season'),
                                value: model.seasoncontroller.text,
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
                                model.getAgriListByvillagefarmernameFilter(
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
                                model.getAgriListByvillagefarmernameFilter(
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
                            'ID',
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
                model.filteredagriList.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemCount: model.filteredagriList.length,
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
                                      model.filteredagriList[index].village ?? '',
                                      maxLines: 2,
                                    ),
                                    AutoSizeText(
                                      model.filteredagriList[index]
                                              .cropVariety ??
                                          '',
                                    ),
                                  ],
                                ),
                                leading:AutoSizeText(
                                  model.filteredagriList[index]
                                      .caneRegistrationId.toString(),
                                      minFontSize: 20,
                                ),
                               
                                title: AutoSizeText(
                                  model.filteredagriList[index].growerName ?? '', maxLines: 2,minFontSize: 10,
                                ),
                                subtitle: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: AutoSizeText(
                                        model.filteredagriList[index].name.toString(),maxLines: 2,
                                      ),
                                    ),
                               const SizedBox(width: 15),
                                    Expanded(
                                      child: AutoSizeText(DateFormat('dd-MM-yyyy').format(DateTime.parse(model.filteredagriList[index].date ??
                                          '')),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  model.onRowClick(
                                      context, model.filteredagriList[index]);
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
      ),
    );
  }
}
