import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/main.dart';
import 'dart:convert';
import 'package:inventory/models/vehicle.dart';
import 'package:inventory/widgets/drawer.dart';
import 'package:inventory/screens/VehiclePage.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Vehicle>> fetchProduct() async {
    print(id);
    var url = Uri.parse('https://kenichi-komala-tugas.pbp.cs.ui.ac.id/owned-vehicles-json/$id');
    var response = await http.get(url, headers: {"Content-Type": "application/json"});
    print(response);
    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Vehicle> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Vehicle.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const EndDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.amount}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.description}"),
                                        ElevatedButton(
                                          onPressed: (){
                                            Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>  VehiclePage(vehicle: snapshot.data![index]))
                                            );
                                          }, 
                                          child: const Text("CheckOut"),
                                        ),
                                    ],
                                    ),
                                ));
                    }
                }
            }));
    }
}
