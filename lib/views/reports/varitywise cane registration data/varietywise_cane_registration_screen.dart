import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/reports/varitywise%20cane%20registration%20data/varietywise_cane_registration_viewmodel.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

import '../../../widgets/customdropdown2.dart';


class VarietyWiseCaneRegistrationReport extends StatefulWidget {
  const VarietyWiseCaneRegistrationReport({super.key});

  @override
  State<VarietyWiseCaneRegistrationReport> createState() => _VarietyWiseCaneRegistrationReportState();
}

class _VarietyWiseCaneRegistrationReportState extends State<VarietyWiseCaneRegistrationReport> {
  // Controllers for the search fields
  final TextEditingController plotNoController = TextEditingController();
  final TextEditingController vendorCodeController = TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController villageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VarietyWiseCaneRegistrationViewModel>.reactive(
      viewModelBuilder: () => VarietyWiseCaneRegistrationViewModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) {

        return Scaffold(
              appBar: AppBar(
                title: const Text('Variety Wise Cane Registration Area Report'),
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
            );});
  }}
DataTable buildDataTable(VarietyWiseCaneRegistrationViewModel model) {
  return DataTable(
    columnSpacing: 20.0,
    border: TableBorder.all(width: 1),
    columns: const [
      DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Circle', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('VCF 0517 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('VCF 0517 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('SNK13374 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('SNK13374 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('COC671 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('COC671 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO10001 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO10001 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO86032 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO86032 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO92005 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO92005 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO92020 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO92020 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO8005 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO8005 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO98005 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO98005 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('COC94012 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('COC94012 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('COC 265 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('COC 265 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('9293 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('9293 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO1110 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO1110 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO7704 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO7704 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO8014 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO8014 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO8021 PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('CO8021 RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('OTHER PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('OTHER RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Total PL', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Total RT', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Total', style: TextStyle(fontWeight: FontWeight.bold))),
    ],
    rows: List<DataRow>.generate(
      model.reportList.length,
      (int index) {
        final item = model.reportList[index];
        return DataRow(
          cells: [
            DataCell(Text((index + 1).toString())),
            DataCell(Text(item.circle.toString())),
            DataCell(Text(item.vCF0517PL?.toString() ?? '0')),
            DataCell(Text(item.vCF0517RT?.toString() ?? '0')),
            DataCell(Text(item.sNK13374PL?.toString() ?? '0')),
            DataCell(Text(item.sNK13374RT?.toString() ?? '0')),
            DataCell(Text(item.cOC265PL?.toString() ?? '0')),
            DataCell(Text(item.cOC265RT?.toString() ?? '0')),
            DataCell(Text(item.cO10001PL?.toString() ?? '0')),
            DataCell(Text(item.cO10001RT?.toString() ?? '0')),
            DataCell(Text(item.cO86032PL?.toString() ?? '0')),
            DataCell(Text(item.cO86032RT?.toString() ?? '0')),
            DataCell(Text(item.cO92005PL?.toString() ?? '0')),
            DataCell(Text(item.cO92005RT?.toString() ?? '0')),
            DataCell(Text(item.cO92020PL?.toString() ?? '0')),
            DataCell(Text(item.cO92020RT?.toString() ?? '0')),
            DataCell(Text(item.cO8005PL?.toString() ?? '0')),
            DataCell(Text(item.cO8005RT?.toString() ?? '0')),
            DataCell(Text(item.cO98005PL?.toString() ?? '0')),
            DataCell(Text(item.cO98005RT?.toString() ?? '0')),
            DataCell(Text(item.cOC94012PL?.toString() ?? '0')),
            DataCell(Text(item.cOC94012RT?.toString() ?? '0')),
            DataCell(Text(item.cOC265PL?.toString() ?? '0')),
            DataCell(Text(item.cOC265RT?.toString() ?? '0')),
            DataCell(Text(item.i9293PL?.toString() ?? '0')),
            DataCell(Text(item.i9293RT?.toString() ?? '0')),
            DataCell(Text(item.cO1110PL?.toString() ?? '0')),
            DataCell(Text(item.cO1110RT?.toString() ?? '0')),
            DataCell(Text(item.cO7704PL?.toString() ?? '0')),
            DataCell(Text(item.cO7704RT?.toString() ?? '0')),
            DataCell(Text(item.cO8014PL?.toString() ?? '0')),
            DataCell(Text(item.cO8014RT?.toString() ?? '0')),
            DataCell(Text(item.cO8021PL?.toString() ?? '0')),
            DataCell(Text(item.cO8021RT?.toString() ?? '0')),
            DataCell(Text(item.oTHERPL?.toString() ?? '0')),
            DataCell(Text(item.oTHERRT?.toString() ?? '0')),
            DataCell(Text(item.totalPL?.toString() ?? '0')),
            DataCell(Text(item.totalRT?.toString() ?? '0')),
            DataCell(Text(item.total?.toString() ?? '0')),
          ],
        );
      },
    ),
  );
}

  
