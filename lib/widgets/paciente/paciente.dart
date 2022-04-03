import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toxicidade/widgets/paciente/pacientes_detail_page.dart';

import 'cadastrar_paciente.dart';

String token = '1|Ge67AMaYNl1g19DjSkqhc2LIQHGJPUN4TfPTvgyh';

Future<List<Paciente>> fetchPaciente(http.Client client) async {
  token;
  //const url = 'http://172.20.0.24:8000/api/pacientes';
  //const url = 'http://192.168.0.107:8000/api/pacientes';
  const url = 'http://toxicidade.sa-east-1.elasticbeanstalk.com/api/pacientes';

  final response = await client.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return compute(parsePaciente, response.body);
  } else {
    throw Exception('Falha ao carregar paciente');
  }
}

List<Paciente> parsePaciente(String responseBody) {
  final parsed = jsonDecode(responseBody);

  return parsed['pacientes']
      .map<Paciente>((json) => Paciente.fromJson(json))
      .toList();
}

class Paciente {
  final String nome;
  final String email;
  final String? cpf;
  final String acesso;
  final String telefone;
  final String? dataNascimento;
  final double? altura;
  final int? peso;
  final int? superficieCorporea;
  bool status;

  Paciente(
      {required this.nome,
      required this.email,
      required this.cpf,
      required this.acesso,
      required this.telefone,
      required this.dataNascimento,
      required this.altura,
      required this.peso,
      required this.superficieCorporea,
      this.status = false});

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
        nome: json['nome'] as String,
        email: json['email'] as String,
        cpf: json['cpf'] as String,
        acesso: json['acesso'] as String,
        telefone: json['telefone'] as String,
        dataNascimento: json['nascimento'],
        altura: json['altura'],
        peso: json['peso'],
        superficieCorporea: json['superficie_corporea']);
  }
}

class PacienteListPage extends StatefulWidget {
  final String? email;
  final String? senha;

  const PacienteListPage({Key? key, this.email, this.senha}) : super(key: key);

  @override
  PacienteListState createState() => PacienteListState();
}

class PacienteListState extends State<PacienteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Paciente'),
      ),
      body: Center(
        child: FutureBuilder<List<Paciente>>(
          future: fetchPaciente(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? PacienteList(pacientes: snapshot.data)
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class PacienteList extends StatefulWidget {
  final List<Paciente>? pacientes;

  const PacienteList({Key? key, this.pacientes}) : super(key: key);

  @override
  State<PacienteList> createState() => _PacienteListState();
}

class _PacienteListState extends State<PacienteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount:
                  widget.pacientes == null ? 0 : widget.pacientes!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      tileColor: Colors.blueGrey.shade50,
                      title: Text(
                        widget.pacientes![index].nome,
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.black),
                      ),
                      trailing: Switch(
                          value: widget.pacientes![index].status,
                          onChanged: (value) => setState(
                              () => widget.pacientes![index].status = value)),
                      subtitle: Text(widget.pacientes![index].email),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PacienteDetailPage(
                              paciente: widget.pacientes![index],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PacienteNewPage()),
            ),
            tooltip: 'Cadastrar Paciente',
            child: const Icon(Icons.add_outlined),
          )
        ],
      ),
    );
  }
}
