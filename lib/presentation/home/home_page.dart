import 'package:flutter/material.dart';
import 'package:praktikum_ke3/presentation/profil/profile_page.dart';

class HomePage extends StatefulWidget {
  final String Username;
  const HomePage({super.key, required this.Username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fullname = "";
  String _email = "";
  String _phoneNumber = "";
  String _address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Hai ${widget.Username}\nSelamat Datang",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 24,
                ),
                Text("Lengkapi Biodata"),
                SizedBox(
                  height: 24,
                ),
                _buildForm(),
                SizedBox(
                  height: 24,
                ),
                _buildButtonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value) setStateInput,
    int maxLines = 1,
  }) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        SizedBox(height: 12),
        _formInput(
          hint: "Input Full Name",
          label: "Full Name *",
          setStateInput: (value) {
            setState(() {
              _fullname = value;
            });
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Input Email",
          label: "Email *",
          setStateInput: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Input Phone Number",
          label: "Phone Number *",
          setStateInput: (value) {
            setState(() {
              _phoneNumber = value;
            });
          },
        ),
        SizedBox(height: 12),
        _formInput(
          hint: "Alamat",
          label: "Alamat *",
          setStateInput: (value) {
            setState(() {
              _address = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (_fullname.isEmpty ||
              _email.isEmpty ||
              _phoneNumber.isEmpty ||
              _address.isEmpty) {
            SnackBar snackBar =
                SnackBar(content: Text("*Data tidak boleh kosong"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage(
                name: _fullname,
                username: widget.Username,
                email: _email,
                phoneNumber: _phoneNumber,
                address: _address,
              );
            }));
          }
        },
        child: Text("Submit"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
