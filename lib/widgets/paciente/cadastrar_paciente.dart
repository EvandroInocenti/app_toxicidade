import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Paciente> createPaciente(
  String nome,
  String cpf,
  String email,
  String senha,
  String acesso,
  String telefone,
  String dataNascimento,
  String altura,
  String peso,
  String superficieCorporea,
) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'nome': nome,
        'cpf': cpf,
        'email': email,
        'senha': senha,
        'acesso': acesso,
        'telefone': telefone,
        'dataNAscimento': dataNascimento,
        'altura': altura,
        'peso': peso,
        'superficieCorporea': superficieCorporea,
      },
    ),
  );

  if (response.statusCode == 201) {
    return Paciente.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao cadastrar o paciente.');
  }
}

class Paciente {
  final int id;
  final String nome;
  final String email;
  final String senha;
  final String? cpf;
  final String acesso;
  final String telefone;
  final String? dataNascimento;
  final double? altura;
  final int? peso;
  final int? superficieCorporea;

  const Paciente({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.cpf,
    required this.acesso,
    required this.telefone,
    required this.dataNascimento,
    required this.altura,
    required this.peso,
    required this.superficieCorporea,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
        id: json['id'],
        nome: json['nome'] as String,
        email: json['email'] as String,
        senha: json['senha'] as String,
        cpf: json['cpf'] as String,
        acesso: json['acesso'] as String,
        telefone: json['telefone'] as String,
        dataNascimento: json['nascimento'],
        altura: json['altura'] as double,
        peso: json['peso'],
        superficieCorporea: json['superficie_corporea']);
  }
}

class PacienteNewPage extends StatefulWidget {
  const PacienteNewPage({Key? key}) : super(key: key);

  @override
  _PacienteNewState createState() {
    return _PacienteNewState();
  }
}

class _PacienteNewState extends State<PacienteNewPage> {
  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _cpfCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _senhaCtrl = TextEditingController();
  final TextEditingController _acessoCtrl = TextEditingController();
  final TextEditingController _telefoneCtrl = TextEditingController();
  final TextEditingController _nascimentoCtrl = TextEditingController();
  final TextEditingController _alturaCtrl = TextEditingController();
  final TextEditingController _pesoCtrl = TextEditingController();
  final TextEditingController _superficieCorporeaCtrl = TextEditingController();
  Future<Paciente>? _futurePaciente;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Novo Paciente',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de paciente'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              (_futurePaciente == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Nome",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "CPF",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "E-mail",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Telefone",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.datetime,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Data de Nascimento",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Altura",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Peso",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        const TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            labelText: "Superfície corpórea",
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futurePaciente = createPaciente(
                _nomeCtrl.text,
                _cpfCtrl.text,
                _emailCtrl.text,
                _senhaCtrl.text,
                _acessoCtrl.text,
                _telefoneCtrl.text,
                _alturaCtrl.text,
                _pesoCtrl.text,
                _superficieCorporeaCtrl.text,
                _nascimentoCtrl.text,
              );
            });
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }

  FutureBuilder<Paciente> buildFutureBuilder() {
    return FutureBuilder<Paciente>(
      future: _futurePaciente,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.nome);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
