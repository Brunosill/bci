class PessoaFisica {
  final String nome;
  final int cpfCnpj;
  final int codLograd;
  final String lograd;
  final int numero;
  final int aptoScv;
  final String bairro;
  final String cidade;
  final String uf;
  final int cep;

  PessoaFisica(
    this.nome,
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
    return 'Pessoa Fisica{Nome:$nome, cpf/cnpj: $cpfCnpj, cod.Lograd: $codLograd,'
        'Logradradouro: $lograd, Número: $numero, apto.S.CV: $aptoScv, Bairro: $bairro, Cidade: $cidade, UF:$uf, cep: $cep}';
  }
}