import 'package:app_toxicidade/widgets/paciente/paciente.dart';
import 'package:app_toxicidade/widgets/profissional_saude/profissional_saude.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('images/nexo.png'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfissionalSaude(),
                  ),
                ),
              },
              child: const Text('Profissional de Saúde'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PacienteList()),
                ),
              },
              child: const Text('Paciente'),
            ),
          ],
        ),
      ),
    );
  }
}
