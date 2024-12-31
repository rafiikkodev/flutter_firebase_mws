import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

void showDeleteConfirmationScreen(BuildContext context, String bukuId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: const Text('Apakah Anda yakin ingin menghapus buku ini?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Menutup dialog
            },
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              // Menghapus buku
              FirestoreService().hapusBuku(bukuId).then((_) {
                Navigator.pop(context); // Menutup dialog setelah hapus sukses
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buku berhasil dihapus')),
                );
              }).catchError((error) {
                Navigator.pop(context); // Menutup dialog jika terjadi error
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Gagal menghapus buku: $error')),
                );
              });
            },
            child: const Text('Hapus'),
          ),
        ],
      );
    },
  );
}
