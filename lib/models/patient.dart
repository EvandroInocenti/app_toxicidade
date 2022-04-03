class Patient {
  late final String nome;
  late final String email;
  late final String? cpf;
  late final String acesso;
  late final String telefone;
  late final String? dataNascimento;
  late final double? altura;
  late final int? peso;
  late final int? superficieCorporea;
  late bool status;

  Patient(
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
}
