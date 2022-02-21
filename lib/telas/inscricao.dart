import 'package:bci/telas/from/inscricaoform.dart';
import 'package:bci/telas/from/pessoafisica_form.dart';
import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

class Inscricao extends StatefulWidget{

  @override
  State<Inscricao> createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  int _currentIndex = 0;

  final List<Widget> _pages = [PessoaFisicaForm(),InscricaoForm()];

  @override
  Widget build(BuildContext context){
    return BackdropScaffold(
        drawerEnableOpenDragGesture: true,
        appBar: BackdropAppBar(
          automaticallyImplyLeading: false,
          title: Text('Inscrição'),
          actions: <Widget>[
            BackdropToggleButton(icon: AnimatedIcons.list_view,)

            ],
        ),

        //stickyFrontLayer: true,
        frontLayer: _pages[_currentIndex],
      backLayerBackgroundColor: Colors.blue,
        backLayer: BackdropNavigationBackLayer(
          items: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  ListTile(title: Text('Dados do Proprietario', style: TextStyle(fontSize: 18, color: Colors.white)))
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ListTile(title: Text('Dados da Edificação', style: TextStyle(fontSize: 18, color: Colors.white))),
            )
          ],
          onTap: (int position) => {setState(() => _currentIndex = position)},
        ),
        subHeaderAlwaysActive: true,
      );
  }
}