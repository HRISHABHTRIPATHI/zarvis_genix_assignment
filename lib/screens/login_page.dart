import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zarvis_genix_assignment/screens/qr_page.dart';
import 'package:zarvis_genix_assignment/screens/qr_scanner.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () async {
              UserCredential user =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRPage(user: user.user!)));
            },
            child: Text("Login"),
          ),
          ElevatedButton(
            onPressed: () async {
              UserCredential user =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              print(user);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRPage(user: user.user!)));
            },
            child: Text("Sign Up"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QrScanner()));
            },
            child: Text("QR Scanner"),
          ),
        ],
      ),
    );
  }
}
