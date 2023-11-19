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

## Tugas 8

1. Bisa. Setelah data berhasil di fetch dan mendecode jsonnya, kita bisa mengakses isi dari json seperti kita mengakses dictionary. Kerugian yang bisa muncul dari ini adalah kita tidak bisa meng-assign method ke hasil dari jsonnya sehingga akan meyusahkan jika kita ingin melakukan sesuatu terhadap data hasil fetchnya. Selain itu, maintainability dari menggunakan cara ini akan lebih susah.
    
2. CookieRequest merupakan class yang dibuat dalam pbp_django_auth.dart. Fungsi dari CookieRequest adalah untuk mendapatkan cookie yang dibuat oleh django saat user login ke aplikasi karena login yang dilakukan ke aplikasi akan melewati backend django juga. CookieRequest juga menghandle ketika user logout dan juga generate cookie header.

3. Pertama kita perlu mempersiapkan class untuk menampung data dari hasil fetch yang bisa mengubah data json menjadi instance class dan juga instance class menjadi json kita perlu mem-fetch data dari api django kita menggunakan ```http.get('#url')``` setelah data di dapatkan kita harus melakukan ```jsonDecode(response.body)``` agar kita mendapatkan json dari responsenya, setelah itu kita memanggil method ```ClassYangDibuat.fromJson(data)``` untuk mengubah data menjadi instance class. Karena kita sudah mendapatkan instance dari classnya, kita bisa memasukkan atribut yang diperlukan ke dalam widget yang kita mau untuk menampilkan informasi yang ada di instance-nya.

4. Pertama kita harus menginstansiasi CookieRequest karena didalamnya kita memiliki method yang bisa melakukan login ke api yang kita inginkan. Setelah, instansiasi CookieRequest, kita perlu menerima informasi username dan juga password user dengan menggunakan widget TextField. Setelah user mengisi informasi tersebut dan klik login, akan dijalankan program ini yang akan melakukan login user ke api django sehingga user terdaftar dalam daftar yang akses di server websitenya sendiri.
```dart
final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                            'username': username,
                            'password': password,
                            });
```

5. - ListView
        widget untuk menampilkan childrennya dalam urutan yang bisa di-scroll.

   - TextField
        Widget yang menerima input text dari user

   - ElevatedButton
        Widget button yang diberikan elevasi sehingga berada diatas elemen-elemen lain seperti halnya dialog.
   - SizedBox
        Widget yang akan memaksa child nya untuk memiliki tinggi dan/atau lebar spesifik
6. 1. menambahkan app baru pada django khusus untuk autentikasi
   
   2. ```pip install django-cors-headers```
   
   3. tambahin ```corsheaders``` di INSTALLED APPS
   
   4. tambahin ```corsheaders.middleware.CorsMiddleware``` di settings.py Middleware urutan ketiga
   
   5. tambahin 
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
    di settings.py
    
    6. Tambahkan
    ```python
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt
    from django.contrib.auth import logout as auth_logout
    from django.contrib.auth.models import User


    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    'id':user.pk,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
        
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)

    @csrf_exempt  
    def register(request):
        print('register auth')
        # form = UserCreationForm()
        username = request.POST['username']
        password1 = request.POST['password']
        password2 = request.POST['reconfirmPassword']

        if(password1==password2):

            try:
                user= User.objects.create_user(username=username,password=password1)
                if(user!=None):
                    user.save()
                    return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Register berhasil"
                }, status=200)
            except:
                    return JsonResponse({
                    "status": False,
                    "message": "Register gagal, username sudah terambil."
                    }, status=401)
        else:
            return JsonResponse({
                "status": False,
                "message": "Register gagal, password tidak terkonfirmasi sama."
            }, status=401)
    ```
    Agar bisa dilakukan login dan logout via flutter. Jangan lupa menambahkan file urls.py di autentikasi dan masukan ini ke filenya agar flutter bisa melakukan login dan logout
    ```python
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
        path('logout/', logout, name='logout'),
    ]
    ```

    7. run command 
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    flutter pub add http
    ```
    
    8. Ubah MyApp pada main.dart menjadi
    ```dart
    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: MyHomePage()),
            ),
        }
    }
    ```

    9. Tambahkan file login.dart dan masukkan isinya
    ```dart
    import 'package:inventory/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:inventory/screens/register.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';
    import 'package:inventory/main.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Login'),
                ),
                body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                ),
                            ),
                            const SizedBox(height: 12.0),
                            TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                ),
                                obscureText: true,
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                                onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;

                                    final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                    'username': username,
                                    'password': password,
                                    });
                        
                                    if (request.loggedIn) {
                                        String message = response['message'];
                                        String uname = response['username'];
                                        id = response['id'];
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                        ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                                        } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: const Text('Login Gagal'),
                                                content:
                                                    Text(response['message']),
                                                actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        },
                                                    ),
                                                ],
                                            ),
                                        );
                                    }
                                },
                                child: const Text('Login'),
                            ),
                            ElevatedButton(
                            onPressed: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const RegisterApp()),
                                );
                            }, child: const Text('register'))
                        ],
                    ),
                ),
            );
        }
    }
    ```

    10. Buatlah file khusus untuk class model yang aka ndi fetch dari api dalam file models/vehicle.dart
    dan dengan menggunakan QuickType akan dibuatkan classnya dengan mudah.

    11. Pada file android/app/src/main/AndroidManifest.xml tambahkan ```<uses-permission android:name="android.permission.INTERNET" />``` dibawah ```</application>``` 

    12. Tambahkan file untuk membuat daftar produk di aplikasi dengan listform.dart
    ```dart
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'package:inventory/main.dart';
    import 'dart:convert';
    import 'package:inventory/models/vehicle.dart';
    import 'package:inventory/widgets/drawer.dart';

    class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
    }

    class _ProductPageState extends State<ProductPage> {
    Future<List<Vehicle>> fetchProduct() async {
        var url = Uri.parse('http://127.0.0.1:8000/owned-vehicles-json/$id');
        var response = await http.get(url, headers: {"Content-Type": "application/json"});

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
                                            Text(
                                                "${snapshot.data![index].fields.description}")
                                        ],
                                        ),
                                    ));
                        }
                    }
                }));
        }
    }
    ```

    12. Pada drawer.dart tambahkan ListTile baru untuk DaftarProduk
    ```dart
    ListTile(
    leading: const Icon(Icons.shopping_basket),
    title: const Text('Daftar Produk'),
    onTap: () {
        // Route menu ke halaman produk
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductPage()),
        );
      },
    ),
    ```

    13. pada shopcard.dart tambahkan line berikut agar saat tombol ditekan bisa berpindah halaman
    ```dart
    else if (item.name == "Lihat Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
    ```

    14. Pada main/views.py pada projek django tambahkan
    ```python
    @csrf_exempt
    def create_product_flutter(request):
        if request.method == 'POST':
            
            data = json.loads(request.body)

            new_product = Vehicle.objects.create(
                user = request.user,
                name = data["name"],
                amount = int(data["amount"]),
                description = data["description"]
            )

            new_product.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```
    untuk menambahkan vehicle via flutter dan tambahkan juga di urls.py ```path('create-flutter/', create_product_flutter, name='create_product_flutter'),```

    15. Tambahkan line berikut pada listform.dart
    ```dart
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
    ```
    dan ubah tombol onpress menjadi berikut sehingga tombol akan melakukan post ke api django saat tombol di tekan dan membuat objek yang user input
    ```dart
    onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            // Kirim ke Django dan tunggu respons
                            final response = await request.postJson(
                            "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode(<String, String>{
                                'name': _name,
                                'amount': _amount.toString(),
                                'description': _description,
                                // TODO: Sesuaikan field data sesuai dengan aplikasimu
                            }));
                            if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                content: Text("Produk baru berhasil disimpan!"),
                                ));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                );
                            } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    content:
                                        Text("Terdapat kesalahan, silakan coba lagi."),
                                ));
                            }
                        }
                    },
    ```

    16. Pada shopdcard.dart ubahlah bagian method build menjadi
    ```dart
    Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
    ```
    dan juga ubahlah fungsi onTap pada InkWell menjadi async dan tambahkan juga kode berikut agar inkwell bisa digunakan untuk logout
    ```dart
    else if (item.name == "Logout") {
              final response = await request.logout(
                  "http://127.0.0.1:8000/auth/logout/");
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
    ```