import 'package:flutter/material.dart';
import 'package:toxicidade/widgets/paciente/paciente.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PacienteDetailPage extends StatefulWidget {
  final Paciente? paciente;

  const PacienteDetailPage({Key? key, this.paciente}) : super(key: key);

  @override
  State<PacienteDetailPage> createState() => _PacienteDetailPageState();
}

class _PacienteDetailPageState extends State<PacienteDetailPage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Paciente'),
      ),
      body: pacienteDetails(),
    );
  }

  pacienteDetails() {
    Paciente? paciente = widget.paciente;
    //bool status = paciente?.acesso == "Bloqueado" ? false : true;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          FlutterSwitch(
            value: status,
            activeText: "",
            inactiveText: "",
            showOnOff: true,
            activeColor: Colors.indigo,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
