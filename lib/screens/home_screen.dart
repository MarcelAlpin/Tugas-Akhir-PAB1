import 'package:flutter/material.dart';
import 'package:tugas_akhirpab1/data/home_data.dart';
import 'package:tugas_akhirpab1/models/home.dart';
import 'package:tugas_akhirpab1/screens/detail_screen.dart';
import 'package:tugas_akhirpab1/screens/favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(
            62, 255, 153, 0), // Set the AppBar color to orange
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteScreen()));
                },
                label: const Text('Favorite'),
                icon: const Icon(Icons.favorite)),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(
          109, 255, 153, 0), // Set the background color to orange
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              padding: const EdgeInsets.all(8),
              itemCount: kerajinanList.length,
              itemBuilder: (context, index) {
                kerajinan varkerajinan = kerajinanList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(varkerajinan: varkerajinan)));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.all(6),
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Gambar Tempat
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              varkerajinan.gambar,
                              fit: BoxFit.cover,
                            ),
                          )),
                          // Nama Tempat
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              varkerajinan.nama,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
