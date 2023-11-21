import 'package:flutter/material.dart';
import 'package:inventory/models/vehicle.dart';
import 'package:inventory/widgets/drawer.dart';

class VehiclePage extends StatelessWidget {
  final Vehicle vehicle;
  const VehiclePage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Inventory',
            style: TextStyle(fontFamily:"GoogleDisplay"),
          ),
        ),
        endDrawer:const EndDrawer(),
        body:Column(children: [
          Text("Name: "+vehicle.fields.name),
          Text("Amount: "+vehicle.fields.amount.toString()),
          Text("Owned By: "+vehicle.fields.user.toString()),
          Text("Description: "+vehicle.fields.description),
        ],)
      );
      }
}