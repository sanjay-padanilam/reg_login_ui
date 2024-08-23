import 'package:flutter/material.dart';
import 'package:reg_login_ui/view/loginpage/loginpage.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final _FormKey = GlobalKey<FormState>();
  TextEditingController regmailcontroller = new TextEditingController();
  TextEditingController regpasscontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("registration page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          if (_FormKey.currentState!.validate()) {}
        },
        child: Icon(Icons.check),
      ),
      body: Form(
        key: _FormKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: regmailcontroller,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green, width: 2.5),
                      ),
                    ),
                    validator: (value) {
                      if (regmailcontroller.text.isEmpty ||
                          !regmailcontroller.text.contains("@")) {
                        return "Enter a valid Email";
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: regpasscontroller,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    hintText: "enter",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green, width: 2.5),
                    ),
                  ),
                  validator: (value) {
                    if (regpasscontroller.text.isEmpty ||
                        regpasscontroller.text.length < 6) {
                      return "password must contain 6 characters";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Confirm Password"),
                    hintText: "enter your Password",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green, width: 2.5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a valid password";
                    } else if (value != regpasscontroller.text) {
                      return "invalid password";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    setState(() {});
                    if (_FormKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Loginpage(
                                  email: regmailcontroller.text,
                                  password: regpasscontroller.text)));
                    }
                  },
                  child: Text("SignUp"))
            ],
          ),
        ),
      ),
    );
  }
}
