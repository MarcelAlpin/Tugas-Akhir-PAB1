import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Hinted search text',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(Icons.image, size: 40, color: Colors.grey),
              title: Text('title'),
              onTap: () {
                // Aksi saat item di klik
                print('Clicked on ');
              },
            ),
          );
        },
      ),
    );
  }
}
