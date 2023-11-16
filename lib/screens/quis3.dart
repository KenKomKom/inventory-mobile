import 'package:flutter/material.dart';
import 'package:inventory/widgets/drawer.dart';
import 'package:inventory/widgets/shopcard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class InventoryPage extends StatelessWidget {

  Future<void> fetchData() async {
    const url = 'http://127.0.0.1:8000/all-vehicle-json/';
    try {
    final response = await http.get(Uri.parse(url));
      print(response.body);
      Map<String, dynamic> extractedData = jsonDecode(response.body);
      extractedData.forEach((key, val) {
      items.add(val);
    });
    } catch (error) {
      print(error);
    }
  }
    InventoryPage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
    ShopItem("Daftar Item", Icons.accessible_forward, Colors.red),
    ShopItem("Tambah Item", Icons.add_circle, Colors.deepOrange),
    ShopItem("Logout", Icons.exit_to_app, Colors.orange),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Inventory',
            style: TextStyle(fontFamily:"GoogleDisplay"),
          ),

          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
      ),
      endDrawer:const EndDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'INVENTORY', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent
                  ),
                ),
              ),

              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                // padding: const EdgeInsets.all(200),
                padding: const EdgeInsets.only(left: 200, top:20, bottom: 0, right: 200) ,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
              // Row(
              //   children: itemsss.map((Item item){
              //     return Card(item);
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
    }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
}

