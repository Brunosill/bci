import 'package:backdrop/backdrop.dart';
import 'package:bci/telas/from/inscricao_form.dart';
import 'package:bci/telas/from/pessoafisica_form.dart';
import 'package:bci/telas/menu/menuinscricao.dart';
import 'package:flutter/material.dart';

class DashDrop extends StatefulWidget{
  const DashDrop({Key? key}) : super(key: key);


  @override
  State<DashDrop> createState() => _DashDropState();
}

class _DashDropState extends State<DashDrop> {
  int _currentIndex = 0;

  final List<Widget> _pages = [MenuInscricao(),InscricaoForm()];

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
                    ListTile(title: Text('Inscrição', style: TextStyle(fontSize: 18, color: Colors.white)))
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