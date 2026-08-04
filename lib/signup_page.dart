import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Signup Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  //Username
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter username";
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  //Email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Email",
                      labelText: "Email",
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter Email";
                      }
                      if(!value.contains("@")) {
                        return "Invalid Email";
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  //Password
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter Password";
                      }
                      if(value.length < 8){
                        return "Password must be at least 8 Characters";
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  //Confirm Password
                  TextFormField(
                    obscureText: true,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Password",
                      labelText: "Confirm Password",
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter password";
                      }
                      if(value != _passwordController.text){
                        return "Passwords do not match";
                      }
                    },
                  ),
                  SizedBox(height: 15),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
