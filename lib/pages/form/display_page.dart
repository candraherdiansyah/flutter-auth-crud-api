import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayPage extends StatelessWidget {
  final String name;
  final String email;
  final DateTime birthDate;
  final String religion;
  final String gender;

  DisplayPage({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.religion,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'User Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Name: $name',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Email: $email',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.cake, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Birth Date: ${DateFormat('d MMMM yyyy').format(birthDate)}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.book, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Religion: $religion',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.wc, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Gender: $gender',
                      style: TextStyle(fontSize: 18),
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
