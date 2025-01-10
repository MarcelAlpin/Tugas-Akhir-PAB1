import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhirpab1/models/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final kerajinan varkerajinan;
  const DetailScreen({super.key, required this.varkerajinan});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];
    setState(() {
      _isFavorite = favoriteHomes.contains(widget.varkerajinan.nama);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];

    setState(() {
      if (_isFavorite) {
        favoriteHomes.remove(widget.varkerajinan.nama);
        _isFavorite = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('${widget.varkerajinan.nama} removed from favorites')));
      } else {
        favoriteHomes.add(widget.varkerajinan.nama);
        _isFavorite = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${widget.varkerajinan.nama} added to favorites')));
      }
    });

    await prefs.setStringList('favoriteHomes', favoriteHomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange.withOpacity(0.5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ---------------- ATAS ------------------
                Stack(
                  children: [
                    // Image Utama
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          widget.varkerajinan.gambar,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        ),
                      ),
                    ),
                    // Tombol Back
                    Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                // Di bawahnya Image Utama
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Judul
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.varkerajinan.nama,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: _toggleFavorite,
                            icon: Icon(_isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: _isFavorite ? Colors.red : null,
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.deepPurple.shade100,
                        thickness: 1,
                      ),
                      // Info lainnya
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.workspaces_outline,
                                      color: Colors.grey),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Bahan',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.varkerajinan.bahan
                                        .asMap()
                                        .entries
                                        .map((entry) =>
                                            '${entry.key + 1}. ${entry.value}')
                                        .join('\n'),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.deepPurple.shade100,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.assignment, color: Colors.grey),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Instruksi',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                    widget.varkerajinan.instruksi
                                        .asMap()
                                        .entries
                                        .map((entry) =>
                                            '${entry.key + 1}. ${entry.value}')
                                        .join('\n'),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.deepPurple.shade100,
                        thickness: 1,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                // ---------------- BAWAH ------------------
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.varkerajinan.gambar.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl: widget.varkerajinan.gambar[index],
                                placeholder: (context, url) => Transform.scale(
                                  scale: 0.2,
                                  child: const CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
