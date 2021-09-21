import "package:flutter/material.dart";
import 'package:rna_learning/components/alert.dart';
import 'package:rna_learning/models/users.dart';
import 'package:rna_learning/screens/employees_screen.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _usrController;
  late TextEditingController _passController;
  late bool _obscurePassword;
  late bool _autovalidate;
  bool logged = false;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _autovalidate = false;
    _usrController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    input(placeholder: "Username", controller: _usrController),
                    const SizedBox(height: 10),
                    input(
                        placeholder: "Password",
                        controller: _passController,
                        isSecret: true),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text("ENTRY",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ))),
                      onPressed: () => _login(),
                    )
                  ],
                ))));
  }

  TextFormField input(
      {String? placeholder,
      bool isSecret = false,
      TextEditingController? controller}) {
    return TextFormField(
      style: const TextStyle(fontSize: 18),
      controller: controller,
      obscureText: isSecret,
      decoration: InputDecoration(labelText: placeholder, isDense: true),
    );
  }

  void _login() {
    var msg = _alertTryLogin(_usrController.text, _passController.text);
    if (msg == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EmployeesPage()));
    } else {
      alert(context, message: msg, color: Colors.red);
    }
  }

  String? _alertTryLogin(String username, String password) {
    var user = validateUser(username);
    if (user != null) {
      if (user.password == password) {
        return null;
      } else {
        return "Password is incorrect, please try again";
      }
    } else {
      return "User not found";
    }
  }
}
