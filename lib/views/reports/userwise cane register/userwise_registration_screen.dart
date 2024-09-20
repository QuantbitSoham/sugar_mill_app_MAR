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
                title: const Text('User Wise Registration'),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 12.0),
                                      labelText: 'From Date',
                                      hintText: 'From Date',
                                      prefixIcon: const Icon(
                                          Icons.calendar_today_rounded),
                                      labelStyle: const TextStyle(
                                        color: Colors.black54,
                                        // Customize label text color
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Colors
                                            .grey, // Customize hint text color
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .blue, // Customize focused border color
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .grey, // Customize enabled border color
                                        ),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 12.0),
                                      labelText: 'To Date',
                                      hintText: 'To Date',
                                      prefixIcon: const Icon(
                                          Icons.calendar_today_rounded),
                                      labelStyle: const TextStyle(
                                        color: Colors.black54,
                                        // Customize label text color
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Colors
                                            .grey, // Customize hint text color
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .blue, // Customize focused border color
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .grey, // Customize enabled border color
                                        ),
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
                            Row(
                              children: [
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
                                // Expanded(
                                //     child: CustomDropdownButton2(
                                //   value: model.workOrder,
                                //   prefixIcon: Icons.person_2,
                                //   items: model.customerGroup,
                                //   hintText: 'Select the Customer group',
                                //   labelText: 'Customer Group',
                                //   onChanged: model.setWorkOrder,
                                // )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
    // Calculate totals for each month and overall
    double totalPlJune =
        model.reportList.fold(0.0, (sum, item) => sum + (item.plJune ?? 0.0));
    double totalRtJune =
        model.reportList.fold(0.0, (sum, item) => sum + (item.rtJune ?? 0.0));
    double totalPlJuly =
        model.reportList.fold(0.0, (sum, item) => sum + (item.plJuly ?? 0.0));
    double totalRtJuly =
        model.reportList.fold(0.0, (sum, item) => sum + (item.rtJuly ?? 0.0));
    double totalPlAugust =
        model.reportList.fold(0.0, (sum, item) => sum + (item.plAugust ?? 0.0));
    double totalRtAugust =
        model.reportList.fold(0.0, (sum, item) => sum + (item.rtAugust ?? 0.0));
    double totalPlSeptember = model.reportList
        .fold(0.0, (sum, item) => sum + (item.plSeptember ?? 0.0));
    double totalRtSeptember = model.reportList
        .fold(0.0, (sum, item) => sum + (item.rtSeptember ?? 0.0));
    double totalPlOctober = model.reportList
        .fold(0.0, (sum, item) => sum + (item.plOctober ?? 0.0));
    double totalRtOctober = model.reportList
        .fold(0.0, (sum, item) => sum + (item.rtOctober ?? 0.0));
    double totalPlNovember = model.reportList
        .fold(0.0, (sum, item) => sum + (item.plNovember ?? 0.0));
    double totalRtNovember = model.reportList
        .fold(0.0, (sum, item) => sum + (item.rtNovember ?? 0.0));
    double totalPlDecember = model.reportList
        .fold(0.0, (sum, item) => sum + (item.plDecember ?? 0.0));
    double totalRtDecember = model.reportList
        .fold(0.0, (sum, item) => sum + (item.rtDecember ?? 0.0));
    double totalPlJanuary = model.reportList
        .fold(0.0, (sum, item) => sum + (item.plJanuary ?? 0.0));
    double totalRtJanuary = model.reportList
        .fold(0.0, (sum, item) => sum + (item.rtJanuary ?? 0.0));
    double totalPlFebruary = model.reportList
        .fold(0.0, (sum, item) => sum + (item.plFebruary ?? 0.0));
    double totalRtFebruary = model.reportList
        .fold(0.0, (sum, item) => sum + (item.rtFebruary ?? 0.0));
    double totalPlMarch =
        model.reportList.fold(0.0, (sum, item) => sum + (item.plMarch ?? 0.0));
    double totalRtMarch =
        model.reportList.fold(0.0, (sum, item) => sum + (item.rtMarch ?? 0.0));

    double totalPlOverall =
        model.reportList.fold(0.0, (sum, item) => sum + (item.plTotal ?? 0.0));
    double totalRtOverall =
        model.reportList.fold(0.0, (sum, item) => sum + (item.rtTotal ?? 0.0));

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
            'Village',
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
        model.reportList.length + 1,
        (int index) {
          if (index == model.reportList.length) {
            return DataRow(
              cells: [
                const DataCell(Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                const DataCell(Text('')),
                DataCell(Text(
                  totalPlJune.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtJune.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlJuly.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtJuly.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlAugust.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtAugust.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlSeptember.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtSeptember.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlOctober.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtOctober.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlNovember.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtNovember.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlDecember.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtDecember.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlJanuary.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtJanuary.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlFebruary.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtFebruary.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlMarch.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtMarch.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalPlOverall.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                DataCell(Text(
                  totalRtOverall.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            );
          } else {
            return DataRow(
              cells: [
                DataCell(Text(
                  (index + 1).toString(),
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].village.toString(),
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plJune?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtJune?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plJuly?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtJuly?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plAugust?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtAugust?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plSeptember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtSeptember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plOctober?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtOctober?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plNovember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtNovember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plDecember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtDecember?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plJanuary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtJanuary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plFebruary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtFebruary?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plMarch?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtMarch?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].plTotal?.toString() ?? '0',
                  maxLines: 2,
                )),
                DataCell(Text(
                  model.reportList[index].rtTotal?.toString() ?? '0',
                  maxLines: 2,
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
