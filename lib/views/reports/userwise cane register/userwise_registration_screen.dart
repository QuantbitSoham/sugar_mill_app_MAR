import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/reports/userwise%20cane%20register/userwise_registration_viewmodel.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';
import '../../../widgets/customdropdown2.dart';

class UserWiseRegistrationReport extends StatelessWidget {
  const UserWiseRegistrationReport({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserRegistrationReportViewModel>.reactive(
        viewModelBuilder: () => UserRegistrationReportViewModel(),
        onViewModelReady: (model) => model.initialise(context),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Circle Wise Cane Registration'),
              ),
              body: fullScreenLoader(
                context: context,
                loader: model.isBusy,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: model.fromController,
                                    onTap: () =>
                                        model.selectValidFromDate(context),
                                    decoration: InputDecoration(
                                      labelText: 'From Date*',
                                      hintText: 'From Date',
                                      prefixIcon: const Icon(Icons.calendar_today_rounded),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Adjust the padding
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        borderSide: const BorderSide(color: Colors.grey, width: 2),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        borderSide: const BorderSide(color: Colors.black45, width: 2),
                                      ),
                                    ),
                                    onChanged: model.onFromDateDobChanged,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    controller: model.toController,
                                    onTap: () =>
                                        model.selectValidTolDate(context),
                                    decoration: InputDecoration(
                                      labelText: 'To Date*',
                                      hintText: 'To Date',
                                      prefixIcon: const Icon(Icons.calendar_today_rounded),
                                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Adjust the padding
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        borderSide: const BorderSide(color: Colors.blue, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        borderSide: const BorderSide(color: Colors.grey, width: 2),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24),
                                        borderSide: const BorderSide(color: Colors.black45, width: 2),
                                      ),
                                    ),
                                    onChanged: model.onToDateChanged,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                                child: CustomDropdownButton2(
                              value: model.season,
                              prefixIcon: Icons.person_2,
                              items: model.seasonList,
                              hintText: 'Select the Season',
                              labelText: 'Season',
                              onChanged: model.setOperation,
                            )),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 4,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: model.reportList.isNotEmpty
                              ? buildDataTable(model)
                              : Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Text(
                                      'Nothing to show.',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  DataTable buildDataTable(UserRegistrationReportViewModel model) {
    return DataTable(
      columnSpacing: 22.0,
      border: TableBorder.all(width: 1),
      columns: const [
        DataColumn(
          label: Text(
            'ID',
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
        DataColumn(
          label: Text(
            'Circle',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL June',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT June',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL July',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT July',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL August',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT August',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL September',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT September',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL October',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT October',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL November',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT November',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL December',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT December',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL January',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT January',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL February',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT February',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL March',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT March',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'PL Total',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'RT Total',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        model.reportList.length ,
        (int index) {

            return DataRow(
              cells: [
                DataCell(Text(
                  (index + 1).toString(),
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].circle.toString(),
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlJune?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtJune?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlJuly?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtJuly?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtAugust?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtAugust?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlSeptember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtSeptember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlOctober?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtOctober?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlNovember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtNovember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlDecember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtDecember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlJanuary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtJanuary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlFebruary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtFebruary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlMarch?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtMarch?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newPlTotal?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].newRtTotal?.toString() ?? '0',
                  maxLines: 2,
                )),
              ],
            );
          }

      ),
    );
  }
}
