import 'package:flutter/widgets.dart';
import 'package:toxicidade/widgets/paciente/paciente.dart';

class PatientList with ChangeNotifier {
  void addPaciente(Paciente paciente) {
    // adicionar paciente
    notifyListeners();
  }
}
