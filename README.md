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
## Tugas 8
1. Navigator.push akan memasukan route baru ke page yang ingin kita tampilkan ke top of stack untuk ditampilkan sedangkan Navigator.pushReplacement akan mengganti top of stack, yaitu route yang kita sedang buka dengan route baru yang kita inginkan sehingga top of stack sebelumnya hilang dari stack.
2.  - Row

        menampilkan children didalamnya dalam susunan horizontal

    - Column

        menampilkan childrennya dalam bentuk susunan vertical

    - Container 

        widget yang menggabungkan positioning, sizing, yang memiliki padding dan margin

    - Padding

        widget yang memberikan padding kepada child nya

    - GridView

        widget yang menampilkan childrennya ke dalam struktur matriks

    - Align 

        widget yang memberikan opsi untuk meletakan childnya pada posisi-posisi seperti atas kanan, bawah kiri, dll. dirinya.

    - Aspect ratio

        widget yang berusaha membuat ukuran child sebesar aspect ratio yang ditentukan

    - Baseline

        widget yang meletakan childnya pada berdasarkan baselinen child nya.

    - Center

        widget yang meletakan childnya ditengah-tengah dirinya.


3. Pada form yang dibuat saya menggunakan TextFormField untuk menerima input user seperti nama, harga, dan deskripsi. Dimana tiap field memiliki validator untuk memastikan input dari user sudah sesuai dengan yang diharapkan.

4. Clean architecture dalam flutter merupakan cara pemrograman yang menganjurkan programer untuk memisahkan bagian UI, domain, dan data. Lapisan UI berfungsi untuk menangani interaksi dengan user dan juga merender tampilan aplikasinya. Lapisan domain berguna untuk mendefinisikan apa yang bisa dilakukan dalam aplikasi dan juga menampung entitas apa saja yang ada di aplikasi. dan Lapisan data adalah yang bertanggung jawab untuk melakukan pengambilan data dan pengiriman data ke databae yang bisa berupa database lokal, remote API, dan provider data lainnya.

5. Checklist dilengkapi dengan cara :

    membuat file dart baru bernama 'drawer.dart' yang berisikan

    ```dart

    import 'package:flutter/material.dart';
    import 'package:inventory/screens/menu.dart';
    import 'package:inventory/screens/listform.dart';

    class EndDrawer extends StatelessWidget {
    const EndDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                ),
                child: Column(
                children: [
                    Text(
                    'Inventory',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Catat seluruh keperluan belanjamu di sini!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color:Colors.white, fontSize: 15),
                        ),
                ],
                ),
            ),
            
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Halaman Utama'),
                // Bagian redirection ke MyHomePage
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                    ));
                },
            ),
            ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Tambah Produk'),
                // Bagian redirection ke ShopFormPage
                onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const ListFormPage(),
                    )
                );
                },
            ),
            ],
        ),
        );
    }
    }
    ```

    setelah itu dilanjutkan dengan membuat file 'listform.dart' untuk menampilkan form pengisian untuk user

    ```dart
    import 'package:flutter/material.dart';

    class ListFormPage extends StatefulWidget {
        const ListFormPage({super.key});

        @override
        State<ListFormPage> createState() => _ListFormPage();
    }

    class _ListFormPage extends State<ListFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _price = 0;
        String _description = "";

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Form Tambah Produk',
                ),
                ),
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white,
            ),
            body: Form(
                key: _formKey,
                child:  SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
                    TextFormField(
                        decoration: InputDecoration(
                        hintText: "Nama Produk",
                        labelText: "Nama Produk",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _name = value!;
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                        }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Deskripsi",
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _description = value!;
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Harga",
                        labelText: "Harga",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _price = int.parse(value!);
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Harga tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                            return "Harga harus berupa angka!";
                        }
                        return null;
                        },
                    ),
                    ),
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.deepOrangeAccent),
                        ),
                        onPressed: () {
                            if (_formKey.currentState!.validate()) {showDialog(
                            context: context,
                            builder: (context) {
                                return AlertDialog(
                                title: const Text('Produk berhasil tersimpan'),
                                content: SingleChildScrollView(
                                    child: Column(
                                    
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        Text('Nama: $_name'),
                                        Text('Harga: $_price'),
                                        Text('Desc: $_description'),
                                    ],
                                    ),
                                ),
                                actions: [
                                    TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                    ),
                                ],
                                );
                            },
                            );
                            _formKey.currentState!.reset();
                            }
                        },
                        child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                        ),
                        ),
                    ),
                    ),
                ]
                ),
                ),
            )
            );
        }
    }
    ```

    setelah itu saya meng refactor kode agar clean code dengan cara memindahkan bagian berikut dari 'menu.dart' ke 'shopcard.dart' 

    ```dart
        import 'package:flutter/material.dart';
        import 'package:inventory/screens/listform.dart';

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
                    if (item.name == "Tambah Item") {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListFormPage(),
                    ));
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
    ```

    lalu saya juga memindahkan file-filenya ke folder-folder sesuai agar lebih rapih.
