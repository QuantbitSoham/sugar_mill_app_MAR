import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../router.router.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 1,
              child: ListTile(
                leading: const Icon(Icons.receipt_long_outlined),

                title: const Text('UserWise Cane Registrations'),

                trailing: const Icon(CupertinoIcons.arrow_right),

                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.userWiseRegistrationReport,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
