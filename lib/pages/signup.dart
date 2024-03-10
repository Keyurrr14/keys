import 'package:flutter/material.dart';
import 'package:keys/pages/home.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
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
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20), // Adjust the top margin as needed
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(

                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4890F0))
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4890F0))
                      ),
                    ),
                    autovalidateMode:AutovalidateMode.onUserInteraction,
                    validator: (email)=>
                    email!=null && !EmailValidator.validate(email)
                        ?"Enter a valid email"
                        :null,
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
                    autovalidateMode:AutovalidateMode.onUserInteraction,
                    validator: (password)=>
                    password!=null && password.length<6
                        ?"Enter min 6 character"
                        :null,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4890F0))
                      ),
                    ),
                    autovalidateMode:AutovalidateMode.onUserInteraction,
                    validator: (password)=>
                    password!=null && password.length<6
                        ?"Enter min 6 character"
                        :null,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      signUp();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()), // Replace Home() with your home screen widget
                      );


                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffF86B70)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 55), // Set the desired height of the button
                      ),
                    ),
                    child: const Text('Sign Up',
                      style: TextStyle(
                        fontSize: 20, // Set the desired font size here
                      ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e){
      print(e);
    }
  }
}