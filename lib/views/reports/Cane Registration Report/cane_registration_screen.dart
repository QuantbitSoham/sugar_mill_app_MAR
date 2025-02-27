import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';
import 'cane_registration_viewmodel.dart';

class CaneRegistrationReport extends StatefulWidget {
  const CaneRegistrationReport({super.key});

  @override
  State<CaneRegistrationReport> createState() => _CaneRegistrationReportState();
}

class _CaneRegistrationReportState extends State<CaneRegistrationReport> {
  // Controllers for the search fields
  final TextEditingController plotNoController = TextEditingController();
  final TextEditingController vendorCodeController = TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController villageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CaneRegistrationViewModel>.reactive(
      viewModelBuilder: () => CaneRegistrationViewModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cane Registration Report'),
        ),
        body: fullScreenLoader(
          context: context,
          loader: model.isBusy,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Date display
                Text(
                  'Generated on: ${DateFormat('yyyy-MM-dd hh:mm aa').format(DateTime.now().toLocal())}',
                  style: const TextStyle(fontSize: 16),
                ),

                // Search Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Row for Plot No and Vendor Code side by side
                      Row(
                        children: [
                          // Plot No Search
                          Expanded(
                            child: TextField(
                              controller: plotNoController,
                              decoration: const InputDecoration(
                                labelText: 'Search by Plot No',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                model.applyFiltersAndSorting(
                                  plotNo: value,
                                  vendorCode: vendorCodeController.text,
                                  vendorName: vendorNameController.text,
                                  village: villageController.text,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10), // Add space between the fields

                          // Vendor Code Search
                          Expanded(
                            child: TextField(
                              controller: vendorCodeController,
                              decoration: const InputDecoration(
                                labelText: 'Search by Vendor Code',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                model.applyFiltersAndSorting(
                                  plotNo: plotNoController.text,
                                  vendorCode: value,
                                  vendorName: vendorNameController.text,
                                  village: villageController.text,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Vendor Name Search
                      TextField(
                        controller: vendorNameController,
                        decoration: const InputDecoration(
                          labelText: 'Search by Vendor Name',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          model.applyFiltersAndSorting(
                            plotNo: plotNoController.text,
                            vendorCode: vendorCodeController.text,
                            vendorName: value,
                            village: villageController.text,
                          );
                        },
                      ),
                      const SizedBox(height: 10),

                      // Village Search
                      TextField(
                        controller: villageController,
                        decoration: const InputDecoration(
                          labelText: 'Search by Village',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          model.applyFiltersAndSorting(
                            plotNo: plotNoController.text,
                            vendorCode: vendorCodeController.text,
                            vendorName: vendorNameController.text,
                            village: value,
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Data Table Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: model.reportList.isNotEmpty
                      ? PaginatedDataTable(
                    showFirstLastButtons: true,
                    header: const Text('Cane Registration Data'),
                    rowsPerPage: 50,
                    availableRowsPerPage: [10, 20, 50],
                    columns: const [
                      DataColumn(label: Text('Plot No')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Grower Code')),
                      DataColumn(label: Text('Grower Name')),
                      DataColumn(label: Text('Survey Number')),
                      DataColumn(label: Text('Vendor Village')),
                      DataColumn(label: Text('Plot Village')),
                      DataColumn(label: Text('Circle Office')),
                      DataColumn(label: Text('Route Name')),
                      DataColumn(label: Text('Route Km')),
                      DataColumn(label: Text('Area')),
                      DataColumn(label: Text('Crop Type')),
                      DataColumn(label: Text('Crop Variety')),
                      DataColumn(label: Text('Supervisor')),
                      DataColumn(label: Text('Location')),
                    ],
                    source: _DataTableSource(model.reportList),
                  )
                      : const Center(child: Text('No data available')),
                ),
              ],
            ),
          ),
        ),
      ),
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
