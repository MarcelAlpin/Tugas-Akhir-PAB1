import 'package:flutter/material.dart';
import 'package:tugas_akhirpab1/models/home.dart';
import 'package:tugas_akhirpab1/data/home_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Make A Scaffold first
    return Scaffold(
      // TODO: Add appBar
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text('Hi, Username'),
          ],
        ),
      ),
      // TODO: Add Body(Isinya yaitu grid table data dan preview saat ditampilkan) after header(AppBar)
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: kerajinanList.length, // Menggunakan jumlah data kerajinan
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Menampilkan 2 kolom di grid
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            var item = kerajinanList[index]; // Ambil item berdasarkan index
            return GestureDetector(
              onTap: () {
                // Aksi saat item ditekan
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(item.nama),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(item.gambar,
                              fit: BoxFit.cover), // Menampilkan gambar
                          SizedBox(height: 8),
                          Text(
                            'Bahan:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          for (var bahan in item.bahan)
                            Text('- $bahan'), // Menampilkan daftar bahan
                          SizedBox(height: 8),
                          Text(
                            'Instruksi:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          for (var instruksi in item.instruksi)
                            Text('- $instruksi'), // Menampilkan langkah-langkah
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        item.gambar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item.nama,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      // TODO: Add BackGround colors
      backgroundColor: Colors.orange[100],
    );
  }
}
