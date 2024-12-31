import 'package:flutter/material.dart';
import '../models/buku.dart';
import '../services/firestore_service.dart';

class UpdateBukuScreen extends StatefulWidget {
  final Buku buku;

  const UpdateBukuScreen({super.key, required this.buku});

  @override
  _UpdateBukuScreenState createState() => _UpdateBukuScreenState();
}

class _UpdateBukuScreenState extends State<UpdateBukuScreen> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _pengarangController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _judulController.text = widget.buku.judul;
    _pengarangController.text = widget.buku.pengarang;
    _hargaController.text = widget.buku.harga.toString();
  }

  void _updateBuku() {
    final judul = _judulController.text.trim();
    final pengarang = _pengarangController.text.trim();
    final harga = int.tryParse(_hargaController.text.trim());

    if (judul.isEmpty || pengarang.isEmpty || harga == null || harga <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harap isi semua data dengan benar!')),
      );
      return;
    }

    Buku updatedBuku = Buku(
      id: widget.buku.id,
      judul: judul,
      pengarang: pengarang,
      harga: harga,
    );

    FirestoreService().updateBuku(widget.buku.id, updatedBuku).then((_) {
      Navigator.pop(context); // Kembali ke halaman sebelumnya setelah update
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memperbarui buku: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Buku')),
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
              onPressed: _updateBuku,
              child: const Text('Update Buku'),
            ),
          ],
        ),
      ),
    );
  }
}
