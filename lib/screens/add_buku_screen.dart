import 'package:flutter/material.dart';
import '../models/buku.dart';
import '../services/firestore_service.dart';

class AddBukuScreen extends StatefulWidget {
  const AddBukuScreen({super.key});

  @override
  _AddBukuScreenState createState() => _AddBukuScreenState();
}

class _AddBukuScreenState extends State<AddBukuScreen> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _pengarangController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  void _saveBuku() {
    final judul = _judulController.text.trim();
    final pengarang = _pengarangController.text.trim();
    final harga = int.tryParse(_hargaController.text.trim());

    if (judul.isEmpty || pengarang.isEmpty || harga == null || harga <= 0) {
      // Menampilkan snackbar jika input tidak valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua data dengan benar!')),
      );
      return;
    }

    Buku buku = Buku(
      id: '',
      judul: judul,
      pengarang: pengarang,
      harga: harga,
    );

    FirestoreService().tambahBuku(buku).then((_) {
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    }).catchError((error) {
      // Menangani error jika gagal menyimpan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan buku: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Buku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul Buku'),
            ),
            TextField(
              controller: _pengarangController,
              decoration: const InputDecoration(labelText: 'Pengarang'),
            ),
            TextField(
              controller: _hargaController,
              decoration: const InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveBuku,
              child: const Text('Simpan Buku'),
            ),
          ],
        ),
      ),
    );
  }
}
