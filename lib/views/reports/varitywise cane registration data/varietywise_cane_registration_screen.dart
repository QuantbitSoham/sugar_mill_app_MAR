import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/reports/varitywise%20cane%20registration%20data/varietywise_cane_registration_viewmodel.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';


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
      onViewModelReady: (model) => model.fetchData("2024-2025", "2024-06-01", "2025-03-31"),
      builder: (context, model, child) {

        return fullScreenLoader(
          context: context,
          loader:model.isBusy,
          child: Scaffold(
            appBar: AppBar(title: const Text('Dynamic Cane Registration Report')),
            body: model.columnNames.isNotEmpty
                ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: model.columnNames
                    .map((col) => DataColumn(label: Text(col.headerName)))
                    .toList(),
                rows: model.rowData.map((row) {
                  return DataRow(
                    cells: model.columnNames
                        .map((col) => DataCell(Text(row.circle.toString())))
                        .toList(),
                  );
                }).toList(),
              ),
            )
                : const Center(child: Text('No Data Available')),
          ),
        );
      },
    );
  }

}

// DataTableSource for PaginatedDataTable
class _DataTableSource extends DataTableSource {
  final List<dynamic> data;

  _DataTableSource(this.data);

  @override
  DataRow getRow(int index) {
    final dataItem = data[index];
    return DataRow(cells: [
      DataCell(Text(dataItem.plotNo.toString())),
      DataCell(Text(dataItem.plantationStatus.toString())),
      DataCell(Text(dataItem.vendorCode.toString())),
      DataCell(Text(dataItem.growerName.toString())),
      DataCell(Text(dataItem.surveyNumber.toString())),
      DataCell(Text(dataItem.village.toString())),
      DataCell(Text(dataItem.area.toString())),
      DataCell(Text(dataItem.circleOffice.toString())),
      DataCell(Text(dataItem.routeName.toString())),
      DataCell(Text(dataItem.routeKm.toString())),
      DataCell(Text(dataItem.areaAcrs.toString())),
      DataCell(Text(dataItem.cropType.toString())),
      DataCell(Text(dataItem.cropVariety.toString())),
      DataCell(Text(dataItem.supervisorName.toString())),
      DataCell(Text(dataItem.city.toString())),
    ]);
  }

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
