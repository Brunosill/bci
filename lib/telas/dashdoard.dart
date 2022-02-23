import 'package:backdrop/backdrop.dart';
import 'package:bci/telas/from/inscricao_form.dart';
import 'package:bci/telas/menu/menu_inscricao.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({Key? key}) : super(key: key);


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [MenuInscricao(),InscricaoForm()];

  @override
  Widget build(BuildContext context){
    return BackdropScaffold(
      drawerEnableOpenDragGesture: true,
      appBar: BackdropAppBar(
        automaticallyImplyLeading: false,
        title: const Text('Inscrição'),
        actions: const <Widget>[
          BackdropToggleButton(icon: AnimatedIcons.list_view,)
        ],
      ),

      //stickyFrontLayer: true,
      frontLayer: _pages[_currentIndex],
      backLayerBackgroundColor: Colors.blue,
      backLayer: BackdropNavigationBackLayer(
        items: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  children: const <Widget>[
                    ListTile(title: Text('Inscrição', style: TextStyle(fontSize: 18, color: Colors.white)))
                  ]
              )
          ),
          const Padding(
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