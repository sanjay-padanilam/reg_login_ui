import 'dart:ffi';

import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  String email;
  String password;

  Loginpage({required this.email, required this.password, super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController logmaiilcontroller = new TextEditingController();
  TextEditingController logpasscontroller = new TextEditingController();
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          if (_FormKey.currentState!.validate()) {}
        },
        child: Icon(Icons.check),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("login page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _FormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: logmaiilcontroller,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Your Email Address",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                validator: (value) {
                  if (value != widget.email || value == null) {
                    return "email enterd invalid";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: logpasscontroller,
                decoration: InputDecoration(
                  label: Text("password"),
                  hintText: "enter your password",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                ),
                validator: (value) {
                  if (value != widget.password || value == null) {
                    return "invalid password";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      iconColor: WidgetStatePropertyAll(Colors.white),
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    setState(() {});
                    if (_FormKey.currentState!.validate()) {
                      print("signing sucessful");
                    }
                  },
                  child: Text("Sign in"))
            ],
          ),
        ),
      ),
    );
  }
}
