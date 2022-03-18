import 'dart:convert';
import 'package:bci/modelos/cep_web.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import '../interceptor/logging_interceptor.dart';

class CepApi{
  Future<CepWeb> findAll(cep) async {
    Client client = InterceptedClient.build(interceptors:[LoggingInterceptor()] );
    final Response response = await client.get(Uri.parse('http://viacep.com.br/ws/${cep}/json/')).timeout(Duration(seconds: 5));
    final dynamic decodedJson = jsonDecode(response.body);
    final CepWeb cepWeb = CepWeb(
        decodedJson['cep'],
        decodedJson['logradouro'],
        decodedJson['bairro'],
        decodedJson['localidade'],
        decodedJson['uf']);
    return cepWeb;
  }
}