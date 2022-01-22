class PessoaFisica {
  //final int id;
  final String nome;
  final String cpfCnpj;
  final String codLograd;
  final String lograd;
  final String numero;
  final String aptoScv;
  final String bairro;
  final String cidade;
  final String uf;
  final String cep;

  PessoaFisica(
    //this.id,
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
    return 'Pessoa Fisica{ Nome:$nome, cpf/cnpj: $cpfCnpj, cod.Lograd: $codLograd,'
        'Logradradouro: $lograd, Número: $numero, apto.S.CV: $aptoScv, Bairro: $bairro, Cidade: $cidade, UF:$uf, cep: $cep}';
  }
}