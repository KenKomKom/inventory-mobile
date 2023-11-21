import 'package:flutter/material.dart';
import 'package:inventory/screens/listform.dart';
import 'package:inventory/main.dart';
import 'package:inventory/screens/list_vehicle.dart';
import 'package:inventory/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            if (item.name == "Tambah Item") {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListFormPage(),
              ));
            }
            else if (item.name == "Daftar Item") {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
            }
            else if (item.name == "Logout") {
              final response = await request.logout(
                  "http://kenichi-komala-tugas.pbp.cs.ui.ac.id/auth/logout/");
              String message = response["message"];
              if (response['status']) {
                String uname = response["username"];
                id=0;

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        },
        
        borderRadius: BorderRadius.circular(12),
        child: Container(
          // Container untuk menyimpan Icon dan Text
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: item.color,
          boxShadow: [
            BoxShadow(spreadRadius: 3),
          ],
        ),
          padding: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 50.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
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