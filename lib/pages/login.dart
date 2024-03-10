import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keys/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log In',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 80), // Adjust the top margin as needed
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4890F0))
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4890F0))
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: signIn,

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffF86B70)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 55), // Set the desired height of the button
                  ),
                ),
                child: const Text('Log In',
                  style: TextStyle(
                    fontSize: 20, // Set the desired font size here
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future signIn() async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e){
      print(e);
    }
  }
}