import 'package:flutter/material.dart';
import 'package:praktikum_ke3/presentation/authentication/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String address;

  const ProfilePage({
    Key? key,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    this.address = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Profil"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "Biodata",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              FlutterLogo(size: 150),
              SizedBox(height: 12),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                email,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                phoneNumber,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                address,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24), // Spacing before the button
              ElevatedButton(
                onPressed: () {
                  // Ganti halaman ke login_page.dart
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Kembali ke Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
