import 'package:flutter/material.dart';
import 'package:flutter_firebase_mws/screens/add_buku_screen.dart';
import 'package:flutter_firebase_mws/screens/update_buku_screen.dart';
import 'package:flutter_firebase_mws/screens/delete_buku_screen.dart';
import '../models/buku.dart';
import '../services/firestore_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Buku Online'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Aksi untuk menambah buku baru
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddBukuScreen()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Buku>>(
        stream: FirestoreService().getDaftarBuku(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data buku.'));
          }

          List<Buku> bukuList = snapshot.data!;
          return ListView.builder(
            itemCount: bukuList.length,
            itemBuilder: (context, index) {
              Buku buku = bukuList[index];
              return ListTile(
                title: Text(buku.judul),
                subtitle: Text(buku.pengarang),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Menampilkan harga buku di trailing
                    Text('Rp ${buku.harga}',
                        style: TextStyle(color: Colors.green)),
                    SizedBox(width: 10),
                    // Ikon edit untuk update buku
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateBukuScreen(buku: buku),
                          ),
                        );
                      },
                    ),
                    // Ikon hapus untuk menghapus buku
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDeleteConfirmationScreen(context, buku.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
