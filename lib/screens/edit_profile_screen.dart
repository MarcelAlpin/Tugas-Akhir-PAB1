import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            GestureDetector(
              onTap: () {
                // Logic for uploading profile picture
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.add_photo_alternate,
                  size: 40,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Name Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Description Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Visibility Dropdown

            SizedBox(height: 30),
            // Confirm Button
            ElevatedButton(
              onPressed: () {
                // Logic for saving changes
                print('Nama:');
                print('Deskripsi: ');
                print('Visibility: ');
              },
              child: Text('Confirm'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
