import 'package:flutter/material.dart';
import 'package:praktikum_ke3/presentation/home/home_page.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
State<LoginPages> createState() => _LoginPagesStates();}

bool isLoginSucces = true;

class _LoginPagesStates extends State<LoginPages> {
  String Username = "";
  String Password = "";
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
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextFormField(
      enabled: true,
      onChanged: (value) {
        Username = value;
      },
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: const EdgeInsets.all(8.0),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const OutlineInputBorder( // menambahkan focusedBorder
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
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
       decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.all(8.0),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const OutlineInputBorder( // menambahkan focusedBorder
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
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
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: (isLoginSucces) ? Colors.blue: Colors.red),
      onPressed: (){
        String text = "";
        if(Password == "123"){
         setState(() {
           text = "Login succes!";
           isLoginSucces = true;
         });

          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context){
            return HomePage (Username:Username);
          }));

        } else { 
           setState(() {
           text = "Login Failed!";
           isLoginSucces = false;
         });
        }
        SnackBar snackBar = SnackBar(content: Text(text));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('Login'),
    ),
  );
 }
}