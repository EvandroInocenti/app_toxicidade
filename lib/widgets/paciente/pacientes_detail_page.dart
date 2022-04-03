import 'package:flutter/material.dart';
import 'package:toxicidade/widgets/paciente/paciente.dart';

class PacienteDetailPage extends StatefulWidget {
  final Paciente? paciente;

  const PacienteDetailPage({Key? key, this.paciente}) : super(key: key);

  @override
  State<PacienteDetailPage> createState() => _PacienteDetailPageState();
}

class _PacienteDetailPageState extends State<PacienteDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Paciente'),
      ),
      body: _pacienteDetails(),
    );
  }

  _pacienteDetails() {
    Paciente? paciente = widget.paciente;
    //bool status = paciente?.acesso == "Bloqueado" ? false : true;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 0.5,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente!.nome,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 0.5,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.email,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.telefone,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.altura.toString(),
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.dataNascimento.toString(),
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.peso.toString(),
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.superficieCorporea.toString(),
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 0.5,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                paciente.acesso,
                style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
