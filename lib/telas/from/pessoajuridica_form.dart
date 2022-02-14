import 'package:bci/database/dao/dao_base/pessoas/pessoajuridica_dao.dart';
import 'package:bci/modelos/base_modelo/pessoas/pessoajuridica.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PessoaJuridicaForm extends StatefulWidget {
  const PessoaJuridicaForm({Key? key}) : super(key: key);

  @override
  State<PessoaJuridicaForm> createState() => _PessoaJuridicaFormState();
}

class _PessoaJuridicaFormState extends State<PessoaJuridicaForm> {

  //controler
  int _index =0;

  final _formDados = GlobalKey<FormState>();
  final TextEditingController _razaoSocialController = TextEditingController();
  final TextEditingController _cpfCnpjController = TextEditingController();
  final TextEditingController _inscriEstadualController = TextEditingController();
  final TextEditingController _inscriMunicialController = TextEditingController();
  final TextEditingController _cnaeController = TextEditingController();
  final TextEditingController _nomeFantasiaController = TextEditingController();

  final _formFical = GlobalKey<FormState>();
  late String _dropRegime = 'Pessoa Fisica';
  late bool _regimeState = false;
  late String _dropAtividade = 'Comércio';
  final TextEditingController _regimeController = TextEditingController();
  final TextEditingController _ativiadeController = TextEditingController();
  late bool _alvaraState = false;
  late bool _icmsState = false;
  late bool _issState = false;
  late bool _vlgSanitaria = false;
  late bool _mEmpresaState = false;
  late bool _emiteNFiscalState = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro de Pessoa Juridica'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Stepper(
              currentStep: _index,
              steps: <Step>[
                Step(
                  title: const Text('Registro Empresa',
                      style: TextStyle(
                        fontSize: 20.0),),
                  isActive: _index >= 0,
                  content: Form(
                    key: _formDados,
                    child: Column(
                      children: <Widget>[

                        TextFormField(
                          controller: _nomeFantasiaController,
                          decoration: const InputDecoration(
                              labelText: 'Nome Fantasia'
                          ),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textCapitalization: TextCapitalization.words,
                          validator: (value){
                            if(value!.length <= 3){
                              return 'Digite Nome Fantasia';
                            }
                            return null;
                          }
                        ), //nome fantasia

                        TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'CPF/CNPJ'
                            ),
                            maxLength: 18,
                            style: const TextStyle(
                                fontSize: 20
                            ),
                            controller: _cpfCnpjController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfOuCnpjFormatter(),
                            ],
                            validator: (value){
                              if(!CPFValidator.isValid(value)){
                                return 'Digite Cpf ou Cnpj valido';
                              }
                              return null;
                            }
                        ),

                        Row(
                          children: <Widget>[
                            const Text('Regime: ',
                            style: TextStyle(
                              fontSize: 20.0
                            )),
                            DropdownButton(
                              value: _dropRegime,
                              icon:  const Icon(Icons.arrow_downward),
                              elevation: 16,
                              //style: const TextStyle( fontSize: 20),
                              items: <String>['Pessoa Fisica', 'Pessoa Jurídica', 'Sociedade Civil']
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: const TextStyle(
                                        fontSize: 20
                                      )),
                                );
                              }).toList(),
                              onChanged: (String? novovalue){
                                setState((){
                                  _dropRegime = novovalue!;
                                });
                              },
                            ),
                          ]
                        ),

                        Row(
                          children: <Widget>[
                            const Text('Atividade: ',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                            DropdownButton(
                              value: _dropAtividade,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              onChanged: (String? novoValue){
                                setState((){
                                  _dropAtividade = novoValue!;
                                });
                              },
                              items: <String>['Comércio', 'Serviço', 'Autonomo']
                                    .map<DropdownMenuItem<String>>((String value){
                                     return DropdownMenuItem<String>(
                                       value: value,
                                       child: Text(value,
                                         style: const TextStyle(fontSize: 20)
                                       ),
                                     );
                              }).toList(),
                            ),
                          ]
                        ),
                        
                        Row(
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              child: InputChip(
                                avatar: const CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                selectedColor: Colors.blueAccent,
                                selected: _vlgSanitaria,
                                label: const Text(
                                  'Vig. Sanitária',
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                onPressed: (){
                                  setState((){
                                    _vlgSanitaria = !_vlgSanitaria;
                                  });
                                })
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: InputChip(
                                avatar: const CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                selectedColor: Colors.blueAccent,
                                selected: _alvaraState,
                                label: const Text('Alvara',
                                  style: TextStyle(
                                      fontSize: 18
                                    ),),
                                onPressed: (){
                                  setState((){
                                    _alvaraState = !_alvaraState;
                                  });
                                }
                              ),
                            ),
                            InputChip(
                              avatar: const CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                              ),
                              selectedColor: Colors.blueAccent,
                              selected: _icmsState,
                              label: const Text(
                                'ICMS',
                                style: TextStyle(
                                  fontSize: 18
                                )
                              ),
                              onPressed: (){
                                setState((){
                                  _icmsState = !_icmsState;
                                });
                              }
                            ),

                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              child: InputChip(
                                avatar: const CircleAvatar(
                                  backgroundColor: Colors.blueAccent
                                ),
                                selectedColor: Colors.blueAccent,
                                selected: _issState,
                                label: const Text(
                                  'ISS',
                                  style: TextStyle(
                                    fontSize: 18
                                  ),
                                ),
                                onPressed: (){
                                  setState((){
                                    _issState = !_issState;
                                  });
                                }
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: InputChip(
                                avatar: const CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                selectedColor: Colors.blueAccent,
                                selected: _mEmpresaState,
                                label: const Text(
                                  'M. Empresa',
                                  style: TextStyle(
                                    fontSize: 18,
                                  )
                                ),
                                onPressed: (){
                                  setState((){
                                    _mEmpresaState = !_mEmpresaState;
                                  });
                                }
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: InputChip(
                                avatar: const CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                ),
                                selectedColor: Colors.blueAccent,
                                selected: _emiteNFiscalState,
                                label: const Text(
                                  'Emite N. Fical',
                                  style: TextStyle(
                                    fontSize: 18,
                                  )
                                ),
                                onPressed: (){
                                  setState((){
                                    _emiteNFiscalState = !_emiteNFiscalState;
                                  });
                                }
                              ),
                            ),
                          ]
                        )
                      

                      ]
                    )
                  ),
               ),
                Step(
                  title: const Text('Dados fiscais', style: TextStyle(
                    fontSize: 20
                      )),
                  isActive: _index >= 1,
                  content: Form(
                    key: _formFical,
                    child: Column(
                      children:[

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Razão Socia"
                          ),
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                          controller: _razaoSocialController,
                          textCapitalization: TextCapitalization.words,
                          validator: (value){
                            if(value!.length <= 3){
                              return 'Digite Razão Social';
                            }
                            return null;
                          }
                        ), //nrazao social

                        TextFormField(
                          controller: _inscriEstadualController,
                          decoration: const InputDecoration(
                            labelText: 'Inscrição Estadual'
                          ),
                          style: const TextStyle(
                            fontSize: 20.0
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        ), //inscricao estadual

                        TextFormField(
                          controller: _inscriMunicialController,
                          decoration: const InputDecoration(
                            labelText: 'Inscrição Municipal',
                          ),
                          style: const TextStyle(
                            fontSize: 20
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ]
                        ),

                        TextFormField(
                          controller: _ativiadeController,
                          decoration: const InputDecoration(
                            labelText: 'Atividade Econômica (CNAE)'
                          ),
                          style: const TextStyle(
                            fontSize: 20
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters:[
                            FilteringTextInputFormatter.digitsOnly
                          ]
                        )  //atividade economica

                      ]
                    ),
                  )
                ),
              ],
              onStepCancel: (){
                if (_index >= 0){
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: (){
                final function = [
                  _contiuStep1(context),
                  _contiuStep2(context),
                ];
              },

            )
          )
        )

    );
  }



  _contiuStep1(contex){
    if(_formDados.currentState!.validate() && _index == 0){
      setState((){
        _index += 1;
      });
    } 
  }
 
  _contiuStep2(contex){
    if(_formFical.currentState!.validate() && _index == 1){
      setState(() {
        _salvaProprietario(context);
      });
    }
  }

  void _salvaProprietario(BuildContext context){
    final String cpfCnpj = UtilBrasilFields.removeCaracteres(_cpfCnpjController.text);
    final String razaoSocial = _razaoSocialController.text;
    final String inscriEstadual = _inscriEstadualController.text;
    final String inscriCnpj = cpfCnpj;
    final String inscriMunicipal = _inscriEstadualController.text;
    final String cnae = _cnaeController.text;
    final String nomeFantasia = _nomeFantasiaController.text;
    final String regime = _dropRegime;
    final String atividade = _dropAtividade;
    final int alvara  = _alvaraState ? 1 : 0;
    final int icms  = _icmsState ? 1 : 0;
    final int iss = _issState ? 1 : 0 ;
    final int vlgSanitaria = _vlgSanitaria ? 1 : 0 ;
    final int mEmpresa = _mEmpresaState ? 1 : 0;
    final int emiteNFiscal = _emiteNFiscalState ? 1 : 0;
    final PessoaJuridica novoProprietario = PessoaJuridica(
        cpfCnpj,
        razaoSocial,
        inscriCnpj,
        inscriEstadual,
        inscriMunicipal,
        cnae,
        nomeFantasia,
        regime,
        atividade,
        alvara,
        icms,
        iss,
        vlgSanitaria,
        mEmpresa,
        emiteNFiscal);
    Provider.of<PessoaJuridicaDao>(context, listen: false).save(novoProprietario).then((id) => Navigator.pop(context));
  }
}
