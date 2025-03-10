import 'package:flutter/material.dart';
import 'package:tugas_akhirpab1/data/home_data.dart';
import 'package:tugas_akhirpab1/models/home.dart';
import 'package:tugas_akhirpab1/screens/detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<kerajinan> _favoriteHomes = [];

  Future<void> _loadFavoriteHomes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomesNames =
        prefs.getStringList('favoriteHomes') ?? [];

    setState(() {
      _favoriteHomes = kerajinanList
          .where((home) => favoriteHomesNames.contains(home.nama))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadFavoriteHomes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
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
              itemCount: _favoriteHomes.length,
              itemBuilder: (context, index) {
                kerajinan varkerajinan = _favoriteHomes[index];
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
