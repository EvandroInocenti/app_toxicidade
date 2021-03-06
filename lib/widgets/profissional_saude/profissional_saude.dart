import 'package:toxicidade/widgets/profissional_saude/cadastro.dart';
import 'package:flutter/material.dart';

class ProfissionalSaude extends StatefulWidget {
  const ProfissionalSaude({Key? key}) : super(key: key);

  @override
  _ProfissionalSaudeState createState() => _ProfissionalSaudeState();
}

class _ProfissionalSaudeState extends State<ProfissionalSaude> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Pacientes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        addAutomaticKeepAlives: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(
              child: Text('Paciente ${entries[index]}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroPaciente()),
          ),
        },
        tooltip: 'Novo paciente',
        child: const Icon(Icons.add),
      ),
    );
  }
}
