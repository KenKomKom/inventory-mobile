import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/main.dart';
import 'dart:convert';
import 'package:inventory/models/vehicle.dart';
import 'package:inventory/widgets/drawer.dart';

class ProductPage2 extends StatefulWidget {
    const ProductPage2({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage2> {
Future<List<dynamic>> fetchProduct() async {
    var url = Uri.parse('http://127.0.0.1:8000/all-vehicles-json/');
    var response = await http.get(url, headers: {"Content-Type": "application/json"});

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<dynamic> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(d);
        }
    }
    return list_product;
}



@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengambilan Data JSON TANPA model'),
      ),
      body: FutureBuilder(
        future: fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
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
                                        "${snapshot.data![index]['fields']['name']}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index]['fields']['amount']}"),
                                        const SizedBox(height: 10),
                                        Text(
                                            "${snapshot.data![index]['fields']['description']}")
                                    ],
                                    ),
                                ));
          }
        },
      ),
    );
}
}