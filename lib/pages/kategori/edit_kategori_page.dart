import 'package:flutter/material.dart';
import '../../models/kategori_model.dart';
import '../../services/kategori_service.dart';

class EditKategoriPage extends StatefulWidget {
  final Data kategori;

  EditKategoriPage({required this.kategori});

  @override
  _EditKategoriPageState createState() => _EditKategoriPageState();
}

class _EditKategoriPageState extends State<EditKategoriPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaKategoriController = TextEditingController();
  final KategoriService _kategoriService = KategoriService();

  @override
  void initState() {
    super.initState();
    _namaKategoriController.text = widget.kategori.namaKategori ?? '';
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      bool success = await _kategoriService.updateKategori(
        widget.kategori.id!,
        _namaKategoriController.text,
      );
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kategori berhasil diperbarui')),
        );
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal memperbarui kategori')),
        );
      }
    }
  }

  @override
  void dispose() {
    _namaKategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaKategoriController,
                decoration: InputDecoration(
                  labelText: 'Nama Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama kategori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
