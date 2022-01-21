class Proprietario {
  final String nomeProprietario;
  final int cpfCnpj;
  final int codLograd;
  final String lograd;
  final int numero;
  final int aptoScv;
  final String bairro;
  final String cidade;
  final String uf;
  final int cep;

  Proprietario(
    this.nomeProprietario,
    this.cpfCnpj,
    this.codLograd,
    this.lograd,
    this.numero,
    this.aptoScv,
    this.bairro,
    this.cidade,
    this.uf,
    this.cep,
  );

  @override
  String toString() {
    return 'Proprietario{Nome do Proprietario:$nomeProprietario, cpf/cnpj: $cpfCnpj, cod.Lograd: $codLograd,'
        'Logradradouro: $lograd, Número: $numero, apto.S.CV: $aptoScv, Bairro: $bairro, Cidade: $cidade, UF:$uf, cep: $cep}';
  }
}