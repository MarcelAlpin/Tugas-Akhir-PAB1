class kerajinan {
  final String nama;
  final String gambar;
  final List<String> bahan;
  final List<String> instruksi;

  kerajinan({
    required this.nama,
    required this.gambar,
    required this.bahan,
    required this.instruksi,
  });
}

class profile {
  final String nama;
  final String deskripsi;
  final List<String> gambar;

  profile({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });
}
