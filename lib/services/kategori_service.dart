import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/kategori_model.dart';

class KategoriService {
  final String _baseUrl = 'https://movieapi.smkassalaambandung.sch.id/api';

  Future<Kategori?> fetchKategori() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/kategori'));

      if (response.statusCode == 200) {
        return Kategori.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load kategori');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<bool> storeKategori(String namaKategori) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/kategori'),
      body: {'nama_kategori': namaKategori},
    );

    return response.statusCode == 201;
  }

  Future<bool> updateKategori(int id, String namaKategori) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/kategori/$id'),
      body: {'nama_kategori': namaKategori},
    );

    return response.statusCode == 200;
  }

  Future<bool> deleteKategori(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/kategori/$id'));
    return response.statusCode == 200;
  }
}
