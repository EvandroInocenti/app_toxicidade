import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toxicidade/widgets/paciente/pacientes_detail_page.dart';

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
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //return parsed.map<Paciente>((json) => Paciente.fromJson(json)).toList();

  return parsed['pacientes']
      .map<Paciente>((json) => Paciente.fromJson(json))
      .toList();
}

class Paciente {
  final String nome;
  final String email;
  final String? cpf;
  final String acesso;
//  final String telefone;
//  final DateTime dataNascimento;
//  final Double altura;
//  final Double peso;
//  final Double superficieCorporea;

  const Paciente(
      {required this.nome,
      required this.email,
      required this.cpf,
      required this.acesso});

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
        nome: json['nome'] as String,
        email: json['email'] as String,
        cpf: json['cpf'] as String,
        acesso: json['acesso'] as String);
  }
}

class PacienteListPage extends StatefulWidget {
  const PacienteListPage({Key? key}) : super(key: key);

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

class PacienteList extends StatelessWidget {
  final List<Paciente>? pacientes;

  const PacienteList({Key? key, this.pacientes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pacientes == null ? 0 : pacientes!.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: Colors.blueGrey.shade50,
          title: Text(
            pacientes![index].nome,
            style: const TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          subtitle: Text(pacientes![index].email),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PacienteDetailPage(
                  paciente: pacientes![index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
