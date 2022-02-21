import 'package:bci/database/dao/dao_base/Inscricao/imovel_dao.dart';
import 'package:bci/database/dao/dao_base/Inscricao/setor_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{
  final String path = join(await getDatabasesPath(), 'basesbci.db');
  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute(SetorDao.setorSql);
      db.execute(ImovelDao.tableImovel);
    }, version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}