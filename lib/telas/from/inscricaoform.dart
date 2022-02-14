import 'package:flutter/material.dart';

class InscricaoForm extends StatefulWidget{

  @override
  State<InscricaoForm> createState() => _IncricaoFormState();
}


class _IncricaoFormState extends State<InscricaoForm>{
  late int _index = 0;

  //step1
  late String _dropTipoImovel = 'Predial';
  late bool _situaImovelOutros = false;
  late bool _situaImovelFrente = false;
  late bool _situaImovelFundos = false;
  late bool _situaImovelCasa = false;
  late bool _situaImovelEsquina = false;
  late bool _situaImovelEncrava = false;
  
  late String _dropInsecao = 'Tributário';
  final List _listInsecao = ['Tributário', 'Isento', 'Municipal','Aposentado', 'Federal', 'Templo Religioso', 'C. Popular', 'Estadual', 'Ex-combatente', 'Viúva', 'Outros', 'Utilidade Pública'];
  
  late String _dropPatriTerreno =  'Próprio';
  final List _listPatriTerreno = ['Próprio', 'Federal', 'Ocupado', 'Financiado', 'Foreiro', 'Estadual', 'Posse', 'Filántropico' 'Relisioso', 'Municipal', 'Rendeiro', 'Outros'];
  
  late String _dropColeta = 'Sem Coleta';
  final List _listColeta = ['Sem Coleta', 'Coleta Regular', 'Taxa Base', 'Varrição'];

  late String _dropUsoSolo = 'Casa Residencial';
  final List _listUsoSolo = ['Garagem', 'Terreno', 'Casa Residencial', 'Templo', 'Construc.', 'Ed. Comercial', 'Indústria', 'Banco', 'Clínica/Hospital', 'Associação', 'Outros', ' Predio Público'];

  //step2

  late String _dropElevacao = 'Alvenaria';
  final List _listElevacao = ['Alvenaria', 'Concreto', 'Taipa/Madeira', 'Alvenaria/Concreto', 'Outros'];

  late String _dropCoberta = 'Laje';
  final List _listCoberta = ['Laje', 'Telha', 'Amianto', 'Outros'];

  late String _dropPiso = 'Cimentado';
  final List _listPiso = ['Cimentado', 'Cerâmica', 'Cerâmica/Acimentado', 'Ladrilho Hidráulico', 'Outros'];

  late String _dropEstadoConserv = 'Regular';
  final List _listEstadoConserv = ['Ótimo/Novo', 'Bom', 'Regular', 'Ruim', 'Reforma/Vazio'];

  late String _dropPadrao = 'Normal';
  final List _listPadrao = ['Alto', 'Normal', 'Baixo', 'Muito/Baixo'];

  late String _dropPedologia = 'Normal';
  final List _listPedologia = ['Normal', 'Arenoso', 'Alagado', 'Rochodo', 'Combinação'];

  late String _dropEspecieUm = 'Isolada';
  final List _listEspecieUm = ['Isolada', 'Germinada Um', 'Germinada Dois'];

  late String _dropEspecieDois = '  ';
  final List _listEspecieDois = ['  ', 'Apartamento', 'Ed.Comercial', 'Loja', 'Sala Comercial', 'Hotel/Pousada', 'Hospital/Clínica',
  'Escola', 'Garagem', 'Galpão', 'Clube', 'Ginásio', 'Cinema', 'Posto Combustivel', 'Industria/Fabrica', 'Banco/Inst.Financeira',
  'Ed.Serv. Público', 'Templo/Igreja', 'Construção'];

  //late String _dropEspecieDo
  late String _dropTopografia = 'Plano';
  final List _listTopografia = ['Baixo Nivel', 'Alto Nivel', 'Aclive', 'Combinação', 'Declive', 'Plano' ];

  late String _dropPatrimonioContrucao = 'Particular';
  final List _listPatrimonioContrucao = ['Particular', 'Federal', 'Estadual', 'Municipal', 'Religioso', 'Financiado', 'Ocupação','Outros'];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Stepper(
            currentStep: _index,
            onStepContinue: (){
              if(_index >= 0){
                setState((){
                  _index += 1;
                });
              }
            },
            onStepCancel: (){
              if(_index >= 0){
                setState((){
                  _index -= 1;
                });
              }
            },

            steps: <Step>[
              Step(
                title: const Text('Inscrição', style: TextStyle( fontSize: 20),),
                //isActive: _index <= 0,
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),

                        child: Row(
                          children: <Widget>[
                            const Text('Tipo de Imóvel : ', style: TextStyle(fontSize: 20),),
                            DropdownButton(
                              value: _dropTipoImovel,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              items: <String>['Predial', 'Territorial', 'Comercial']
                                  .map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(fontSize: 20)
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue){
                                setState((){ _dropTipoImovel = newValue!; });
                              },
                            ),
                        ]
                        ),

                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            const Text('Situação do Imóvel', style: TextStyle(fontSize: 20)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  _seletorItem('Frente', _situaImovelFrente), //frente
                                  _seletorItem('Fundo', _situaImovelFundos), //fundo
                                  _seletorItem('Casa de Vila', _situaImovelCasa), //casa de vila
                                ]
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  _seletorItem('Esquina', _situaImovelEsquina),
                                  _seletorItem('Encravada', _situaImovelEncrava),
                                  _seletorItem('Outros', _situaImovelOutros),
                                ]
                              ),
                            )
                          ],
                        )
                      ),

                      _listSeletor('Patrimonio do Terreno: ', _dropPatriTerreno, _listPatriTerreno),
                      
                      _listSeletor('Inseção: ', _dropInsecao,_listInsecao),

                      _listSeletor('Uso do Solo: ', _dropUsoSolo, _listUsoSolo),
                      
                      _listSeletor('Coleta: ', _dropColeta, _listColeta),
                    ]
                  )
                ),
              ),
              Step(
                //isActive: _index <= 1,
                title: const Text('Dados da Edificação', style: TextStyle(fontSize: 20 )),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Elevação : ', style: TextStyle(fontSize: 18),),
                          DropdownButton(
                            value: _dropElevacao,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: _listElevacao.map<DropdownMenuItem<String>>((value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(fontSize: 18),),
                              );
                            }).toList(),
                            onChanged: (String? newValue){
                              setState((){
                                _dropElevacao = newValue!;
                              });
                            }
                          )
                        ]
                      ),
                      Row(
                        children: <Widget>[
                          Text('Coberta : ', style: TextStyle(fontSize: 18),),
                          DropdownButton(
                            value: _dropCoberta,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: _listCoberta.map<DropdownMenuItem<String>>((value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(fontSize: 18),),
                              );
                            }).toList(),
                            onChanged: (String? newValue){
                              setState((){
                                _dropCoberta = newValue!;
                              });
                            }
                          )
                        ]
                      ),
                      Row(
                        children: <Widget>[
                          Text('Piso: ', style: TextStyle(fontSize: 18),),
                          DropdownButton(
                            value: _dropPiso,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: _listPiso.map<DropdownMenuItem<String>>((value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(fontSize: 18),),
                              );
                            }).toList(),
                            onChanged: (String? newValue){
                              setState((){
                                _dropPiso = newValue!;
                              });
                            }

                          ),
                        ]
                      ),
                      Row(
                        children: <Widget>[
                          Text('Estado Conserv.: ', style: TextStyle(fontSize: 18)),
                          DropdownButton(
                            value: _dropEstadoConserv,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: _listEstadoConserv.map<DropdownMenuItem<String>>((value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: const TextStyle(fontSize: 18),),
                              );
                            }).toList(),
                            onChanged: (String? newValue){
                              setState((){
                                _dropEstadoConserv = newValue!;
                              });
                            }
                          ),
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Text('Padrão: ', style: const TextStyle(fontSize: 18)),
                            DropdownButton(
                                value: _dropPadrao,
                                icon: const Icon(Icons.arrow_drop_down),
                                items: _listPadrao.map<DropdownMenuItem<String>>((value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: const TextStyle(fontSize: 18)),
                                  );
                                }).toList(),
                                onChanged: (String? newValue){
                                  setState((){
                                    _dropPadrao = newValue!;
                                  });
                                }
                            )
                          ]
                      ),
                      Row(
                          children: <Widget>[
                            const Text('Pedalogia: ', style: TextStyle(fontSize: 18)),
                            DropdownButton(
                                value: _dropPedologia,
                                icon: const Icon(Icons.arrow_drop_down),
                                items: _listPedologia.map<DropdownMenuItem<String>>((value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: const TextStyle(fontSize: 18)),
                                  );
                                }).toList(),
                                onChanged: (String? newValue){
                                  setState((){
                                    _dropPedologia = newValue!;
                                  });
                                }
                            )
                          ]
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.min,
                            children: <Widget>[
                              Text('Especie', style: TextStyle(fontSize: 18)),
                              DropdownButton(
                                  value: _dropEspecieUm,
                                  icon: Icon(Icons.arrow_drop_down),
                                  items: _listEspecieUm.map<DropdownMenuItem<String>>((value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: const TextStyle(fontSize: 18)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue){
                                    setState((){
                                      _dropEspecieUm = newValue!;
                                    });
                                  }
                              ),
                              DropdownButton(
                                  value: _dropEspecieDois,
                                  icon: Icon(Icons.arrow_drop_down),
                                  items: _listEspecieDois.map<DropdownMenuItem<String>>((value){
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: const TextStyle(fontSize: 18)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue){
                                    setState(() {
                                      _dropEspecieDois = newValue!;
                                    });
                                  }
                              ),
                            ]
                        ),
                      ),


                    ]
                  )
                ),
              ),
            ],

          )
        )
      )
    );
  }
}



class _seletorItem extends StatefulWidget{
  final String _inputText;
  late bool _inputState;

  _seletorItem(this._inputText, this._inputState);

  @override
  State<_seletorItem> createState() => _seletorItemState();
}

class _seletorItemState extends State<_seletorItem> {
  @override
  Widget build(BuildContext context){
    return InputChip(
      avatar: const CircleAvatar(
        backgroundColor: Colors.blueAccent,
      ),
      selectedColor: Colors.blueAccent,
      selected: widget._inputState,
      label: Text(widget._inputText, style: TextStyle( fontSize: 20)),
      onPressed: (){
        setState(() {
          widget._inputState = !widget._inputState;
        });
      }
    );
  }
}

class _listSeletor extends StatefulWidget{
  late String _tituloList;
  late String _dropSaida;
  late List _dropLista = [];

  _listSeletor(this._tituloList, this._dropSaida, this._dropLista);

  @override
  State<_listSeletor> createState() => _listSeletorState();
}

class _listSeletorState extends State<_listSeletor>{
  @override
  Widget build(BuildContext context){
    return Container(

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Text(widget._tituloList, style: const TextStyle(fontSize: 18),),
            DropdownButton(
              value: widget._dropSaida,
              icon: const Icon(Icons.arrow_drop_down),
              items: widget._dropLista.map<DropdownMenuItem<String>>((value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                      style: const TextStyle(fontSize: 18),),
                    );
              }).toList(),
              onChanged: (String? newValue){
                setState((){
                  widget._dropSaida = newValue!;
                });
              }
            )
          ]
        ),
      )
    );
  }
}