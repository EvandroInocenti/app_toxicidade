// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:toxicidade/widgets/paciente/paciente.dart';
import 'package:toxicidade/widgets/profissional_saude/profissional_saude.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailCtrl = TextEditingController();
  final _senhaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('images/nexo.png'),
              ),

              TextField(
                controller: _emailCtrl,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "email",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),

              TextField(
                controller: _senhaCtrl,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              //Divider(),
              ButtonTheme(
                height: 90.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PacienteListPage(),
                      ),
                    );
                  },
                  child: const Text('Acessar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> login(_email, _password) async {
    Map data = {"email": _email, "password": _password};

    final response = await http.post(
      Uri.parse('http://toxicidade.sa-east-1.elasticbeanstalk.com/api/login'),
      headers: {
        "Accept": "application/json",
      },
      body: data,
    );

    print(json.decode(response.body));

    return response.body;
  }
}
