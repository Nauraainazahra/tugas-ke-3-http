import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
     LoginPage({Key? key}) : super(key: key); // cons diilangin nanti user akan merubah ubah 
     String Username =""; // statefull wiget bisa diubah didalam nya dengan kondisi running 
     String Password ="";

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login"),
        ),

        body:Column(
        children: [
          _usernameField(), // ada ada isinya (bakal diisi)
          _passwordField(), // ada ada isinya (bakal diisi)
          _loginButton(context),
        ],
      ),

      ),
    );
  }

    Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){// tambahakan onchange 
          Username = value;
        }, // agar user bisa input
        decoration: const InputDecoration(
          hintText: 'Username', //memberi tulisan pada kolom yang belom diisi
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder( // garis samping agar melengkung
            borderRadius: // size lengkung
            BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue), // garis warna border nya
          ),
        ),
      ),
    );
  }   

      Widget _passwordField (){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText:true, // mengamankan teks
        onChanged: (value){
          Password = value;
        },// agar user bisa input
        decoration: const InputDecoration(
          hintText: 'Password', //memberi tulisan pada kolom yang belom diisi
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder( // garis samping agar melengkung
            borderRadius: // size lengkung
            BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue), // garis warna border nya
          ),
        ),
      ),
    );
  }   


   Widget _loginButton (BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    width: MediaQuery.of(context).size.width,
    child: ElevatedButton(
      onPressed: (){
        String text = "";
        if(Username == "naura" && Password == "123"){
          text = "Login succes";
        } else {
          text = "Login Gagal";
        }
        SnackBar snackBar = SnackBar(content: Text(text));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('Login'),
    ),
  );
 }
}