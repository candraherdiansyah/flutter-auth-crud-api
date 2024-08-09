import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/kategori_model.dart';

class ShowKategoriPage extends StatelessWidget {
  final Data kategori;

  ShowKategoriPage({required this.kategori});

  String formatDate(String? date) {
    if (date == null) return 'Tidak Tersedia';
    final DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Kategori'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.category, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Text(
                      kategori.namaKategori ?? 'Tidak Ada',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.link, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Slug: ${kategori.slug}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      'Created At: ${formatDate(kategori.createdAt)}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.update, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      'Updated At: ${formatDate(kategori.updatedAt)}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
