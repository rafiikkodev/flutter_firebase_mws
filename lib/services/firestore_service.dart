import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/buku.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Menambahkan buku baru
  Future<void> tambahBuku(Buku buku) async {
    CollectionReference bukuCollection = _db.collection('buku');
    await bukuCollection.add(buku.toMap());
  }

  // Mendapatkan daftar buku
  Stream<List<Buku>> getDaftarBuku() {
    return _db.collection('buku').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Buku.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Mengupdate buku
  Future<void> updateBuku(String id, Buku buku) async {
    CollectionReference bukuCollection = _db.collection('buku');
    await bukuCollection.doc(id).update(buku.toMap());
  }

  // Menghapus buku
  Future<void> hapusBuku(String id) async {
    CollectionReference bukuCollection = _db.collection('buku');
    await bukuCollection.doc(id).delete();
  }
}
