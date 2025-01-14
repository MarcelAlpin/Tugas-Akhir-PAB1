import 'package:flutter/material.dart';
import 'package:tugas_akhirpab1/models/home.dart';
import 'package:tugas_akhirpab1/data/home_data.dart';
import 'package:tugas_akhirpab1/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<kerajinan> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = kerajinanList; // Menampilkan semua data secara default
  }

  void filterData(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredList = kerajinanList; // Jika kosong, tampilkan semua data
      } else {
        filteredList = kerajinanList
            .where((item) =>
                item.nama.toLowerCase().contains(keyword.toLowerCase()))
            .toList(); // Filter berdasarkan kata kunci
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        elevation: 0,
        title: TextField(
          controller: searchController,
          onChanged: filterData,
          decoration: InputDecoration(
            hintText: 'Hinted search text',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          var item = filteredList[index];
          kerajinan varkerajinan = filteredList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.network(item.gambar, height: 40, width: 40),
              title: Text(item.nama),
              onTap: () {
                // Aksi saat item di klik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(varkerajinan: varkerajinan),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
