# inventory

## Tugas7
<ul class="contains-task-list containsTaskList_mC6p">
    <li class="task-list-item">
        <input type="checkbox"> Apa perbedaan utama antara <em>stateless</em> dan <em>stateful widget</em> dalam konteks pengembangan aplikasi Flutter?
    </li>
    <li class="task-list-item">
        <input type="checkbox"> Sebutkan seluruh <em>widget</em> yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    </li>
    <li class="task-list-item">
        <input type="checkbox"> Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
    </li>
</ul>

1. Perbedaan dari stateless dan stateful widget pada flutter adalah saat terdapat interaksi dengan user dan widget berubah atau dinamis, maka dikatakan sebagai widget stateful. Misalnya seperti checkbox, radiobutton, slider, inkwell, dan texfield. Di sisi lain, stateless widget tidak terpengaruhi oleh interaksi user.

2. Widget yang saya gunakan pada tugas ini ada :
    
    - Padding : 
    
        widget yang memasang anaknya dengan padding yang sudah ditentukan.
    - Coloumn : 
    
        Widget yang menampilkan isinya(anaknya) dalam struktur yang vertical
    - Text : 
    
        Widget yang menampilkan sebuah String dengan style tertentu. String bisa terdiri dari beberapa baris atau baris yang sama tergantung aturan penataannya.  
    - Grid View : 

        Widget yang menampilkan anaknya dalam struktur array dua dimensi.
    - Container :
    
        Widget yang dapat menampung anak dan mengubah posisi, warna background, margin, padding, dan hiasan pada anak.
    - Center :

        Widget yang akan selalu menampilkan anaknya pada bagian tengah dirinya. Ukuran widget dapat diatur dengan heightFactor dan widthFactor sebagai pengali ukuran widget anaknya.
    - Icon :
        Widget yang berguna untuk menampilkan icon yang tidak interaktif yang sudah terdefinisi di dalam flutter.
    - InkWell :
        

3. Pada awalnya saya membuat projek flutter baru dengan keyword 

    ```flutter create inventory```

    Lalu dilanjutkan dengan membuat file ```menu.dart```
    dan menambahkan baris berikut pada filenya :

    ```dart
    import 'package:flutter/material.dart';

    class ShopItem {
    final String name;
    final IconData icon;

    ShopItem(this.name, this.icon);
    }

    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.accessible_forward),
        ShopItem("Tambah Item", Icons.add_circle),
        ShopItem("Logout", Icons.exit_to_app),
        ];

        @override
        Widget build(BuildContext context) {
            return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Shopping List',
            ),
        ),
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
                    ),
                    ),
                ),

                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
                    return ShopCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
        }

    
    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.indigo,
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
    }
    ```

    Kemudian pada main.dart line 39 kebawah dihilangkan. Untuk membuat warna pada tiap widget ShopCard berbeda, perlu ditambahkan atribut color pada ShopItem dan color di ShopCard dibuat agar bisa menyesuaikan dengan color-color tersebut.
    Perlu ditambahkan line berikut pada class ShopItem

    ```dart
    final Color color;

    ShopItem(this.name, this.icon, this.color);
    ```

    dan juga line berikut pada ShopCard
    ```dart
    return Material(
      color: item.color,
      child: InkWell(
        ...
      )
    );
    ```

    dan pada saat inisialisasi pertama objek kartu, ditambahkan atribut warna.
    ```dart
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.accessible_forward, Colors.red),
        ShopItem("Tambah Item", Icons.add_circle, Colors.black),
        ShopItem("Logout", Icons.exit_to_app, Colors.yellow),
    ];
    ```


