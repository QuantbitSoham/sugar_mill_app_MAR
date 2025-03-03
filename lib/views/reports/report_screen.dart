import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../router.router.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Reports'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: ListView(
                children: [
                  _buildReportCard(
                    context,
                    icon: Icons.receipt_long_outlined,
                    title: 'Circle Wise Cane Registration for crop type',
                    subtitle: 'Detailed report by circles',
                    routeName: Routes.userWiseRegistrationReport,
                  ),
                  _buildReportCard(
                    context,
                    icon: Icons.receipt_long_outlined,
                    title: 'Cane Registration Report',
                    subtitle: 'Complete registration details',
                    routeName: Routes.caneRegistrationReport,
                  ),
                  _buildReportCard(
                    context,
                    icon: Icons.receipt_long_outlined,
                    title: 'Variety Wise Cane Registration Area Report',
                    subtitle: 'Variety Wise Cane Registration Area',
                    routeName: Routes.varietyWiseCaneRegistrationReport,
                  ),
                   _buildReportCard(
                    context,
                    icon: Icons.receipt_long_outlined,
                    title: 'Yard balance vehicle wise',
                    subtitle: 'Pie chart of the yard balance',
                    routeName: Routes.yardBalaneScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required String routeName,
      }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueAccent.withOpacity(0.1),
          child: Icon(
            icon,
            size: 28,
            color: Colors.blueAccent,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.blueAccent,
        ),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
