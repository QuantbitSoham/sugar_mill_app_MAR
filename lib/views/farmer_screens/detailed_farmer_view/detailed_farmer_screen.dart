import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sugar_mill_app/views/farmer_screens/detailed_farmer_view/detailed_farmer_model.dart';
import 'package:sugar_mill_app/widgets/full_screen_loader.dart';

class DetailedFarmerScreen extends StatelessWidget {
  final String id;
  const DetailedFarmerScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailedFarmerModel>.reactive(
      viewModelBuilder: () => DetailedFarmerModel(),
      onViewModelReady: (model) => model.initialise(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(id),
          actions: const [],
        ),
        body: fullScreenLoader(
          context: context,
          loader: model.isBusy,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blueAccent,
                  child: const Text("C1"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blueAccent,
                  child: const Text("C1"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
