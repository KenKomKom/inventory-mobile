import 'package:flutter/material.dart';
import 'package:inventory/screens/daftar.dart';

class Item {
  static final List<Item> defaultItems = [
    Item("Aha",2000, "ketawa"),
    Item("Lala", 30000, "yanto"),
    Item("lmao", 40000, "ketawa2"),
    ];

  final String name;
  final int harga;
  final String description;

  Item(this.name, this.harga, this.description);
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            if (item.name == "Tambah Item") {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DaftarPage(),
              ));
            }
        },
        
        borderRadius: BorderRadius.circular(12),
        child: Container(
          // Container untuk menyimpan Icon dan Text
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepOrange,
          boxShadow: [
            BoxShadow(spreadRadius: 3),
          ],
        ),
          padding: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  item.harga.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  item.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
