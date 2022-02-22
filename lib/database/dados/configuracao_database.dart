import 'package:bci/database/dao/configuracao/setor_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{
  final String path = join(await getDatabasesPath(), 'configuracao.db');
  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute(SetorDao.setorSql);
    }, version: 1,
  );
}