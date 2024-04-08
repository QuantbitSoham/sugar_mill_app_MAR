import 'package:flutter/material.dart';
import 'package:sugar_mill_app/models/aadharData_model.dart';

class ResultScreen extends StatefulWidget {
  final aadharData data;
  const ResultScreen({super.key, required this.data});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('result screen'),),
      body: Center(
        child: Column(
          children: [
            Text(widget.data.name.toString()),
            Text(widget.data.emailMobileStatus.toString()),
            Text(widget.data.location.toString()),
            Text(widget.data.gender.toString()),
            Text(widget.data.dob.toString()),
            Text(widget.data.aadhaarLast4Digit.toString()),
            Text(widget.data.mobile.toString()),
            Text(widget.data.name.toString()),

          ]
        ),
      ),
    );
  }
}
