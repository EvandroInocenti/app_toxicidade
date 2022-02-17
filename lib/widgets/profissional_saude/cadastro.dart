import 'package:flutter/material.dart';

class CadastroPaciente extends StatefulWidget {
  const CadastroPaciente({Key? key}) : super(key: key);

  @override
  _CadastroPacienteState createState() => _CadastroPacienteState();
}

class _CadastroPacienteState extends State<CadastroPaciente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de paciente'),
        ),
        body: Container());
  }
}
