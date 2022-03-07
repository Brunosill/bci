import 'package:backdrop/backdrop.dart';
import 'package:bci/telas/from/incricao/imovel_form.dart';
import 'package:bci/telas/list/config_inscricao_list.dart';
import 'package:bci/telas/menu/menu_inscricao.dart';
import 'package:bci/telas/menu/menu_pessoas.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({Key? key}) : super(key: key);


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [MenuPessoas(),MenuInscricao(),ImovelForm()];

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
        items: const <Widget>[
          Padding(
            padding: EdgeInsets.all(7.0),
            child: ListTile(title: Text('CPF/CNPJ', style:TextStyle(fontSize: 18, color:Colors.white)))
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: ListTile(title: Text('Inscrição', style: TextStyle(fontSize: 18, color:Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.all(7.0),
            child: ListTile(title: Text('Dados da Edificação', style: TextStyle(fontSize: 18, color: Colors.white))),
          ),
        ],
        onTap: (int position) => {setState(() => _currentIndex = position)},
      ),
      subHeaderAlwaysActive: true,
    );
  }
}