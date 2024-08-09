import 'package:flutter/material.dart';
import '../../models/kategori_model.dart';
import '../../services/kategori_service.dart';
import 'create_kategori_page.dart';
import 'edit_kategori_page.dart'; // Import halaman edit kategori
import 'show_kategori_page.dart'; // Import halaman show kategori

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  final KategoriService _kategoriService = KategoriService();
  Kategori? _kategori;

  @override
  void initState() {
    super.initState();
    _fetchKategori();
  }

  void _fetchKategori() async {
    Kategori? kategori = await _kategoriService.fetchKategori();
    setState(() {
      _kategori = kategori;
    });
  }

  Future<void> _navigateToFormPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormKategoriPage()),
    );

    if (result == true) {
      _fetchKategori();
    }
  }

  void _deleteKategori(int id) async {
    bool deleted = await _kategoriService.deleteKategori(id);
    if (deleted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kategori berhasil dihapus')),
      );
      _fetchKategori();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus kategori')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _navigateToFormPage(context),
          ),
        ],
      ),
      body: _kategori == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _kategori!.data?.length ?? 0,
              itemBuilder: (context, index) {
                Data kategori = _kategori!.data![index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kategori.namaKategori ?? 'Tidak Ada',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(kategori.slug.toString()),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ShowKategoriPage(kategori: kategori),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditKategoriPage(kategori: kategori),
                                ),
                              ).then((result) {
                                if (result == true) {
                                  _fetchKategori();
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteKategori(kategori.id!),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
