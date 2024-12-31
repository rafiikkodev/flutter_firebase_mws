class Buku {
  String id;
  String judul;
  String pengarang;
  int harga;

  Buku({
    required this.id,
    required this.judul,
    required this.pengarang,
    required this.harga,
  });

  // Convert model Buku ke Map (untuk disimpan di Firestore)
  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'pengarang': pengarang,
      'harga': harga,
    };
  }

  // Membuat Buku dari Map
  factory Buku.fromMap(Map<String, dynamic> map, String id) {
    return Buku(
      id: id,
      judul: map['judul'] ?? '',
      pengarang: map['pengarang'] ?? '',
      harga: map['harga']?.toInt() ?? 0,
    );
  }

  // Validasi apakah data Buku valid
  bool get isValid {
    return judul.isNotEmpty && pengarang.isNotEmpty && harga > 0;
  }
}
