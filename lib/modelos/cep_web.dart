class CepWeb{
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  //final int Ibge;

  CepWeb(this.cep, this.logradouro, this.bairro, this.localidade, this.uf);

  @override
  String toString(){
    return 'CepApi{cep: $cep, localidade: $localidade, bairro: $bairro,'
    'localidade: $localidade, uf: $uf}';
  }
/*
  CepWeb.fromJson(Map<String, dynamic> json):
        cep = json['cep'],
        logradouro = json['logradouro'],
        complemento = json['complemento'],
        localidade = json['localidade'],
        uf = json['uf'] ;
  Map<String, dynamic> toJson() =>{
    'cep': cep,
    'logradouro' : logradouro,
    'complemento' : complemento,
    'localidade' : localidade,
    'uf' : uf
  };

 */

}