import 'package:flutter/material.dart';
import 'package:inventory/widgets/items.dart';
import 'package:inventory/widgets/drawer.dart';

class DaftarPage extends StatelessWidget {

    const DaftarPage({Key? key}) : super(key: key);

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
                  'DaftarInventory', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent
                  ),
                ),
              ),

              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                // padding: const EdgeInsets.all(200),
                padding: const EdgeInsets.only(left: 0, top:0, bottom: 0, right: 0) ,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 10,
                shrinkWrap: true,
                children: Item.defaultItems.map((Item item) {
                  // Iterasi untuk setiap item
                  return ItemCard(item);
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