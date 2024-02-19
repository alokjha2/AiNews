

import 'package:ainews/models/message.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'chat_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE messages(id INTEGER PRIMARY KEY, sender TEXT, content TEXT, timestamp INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertMessage(Message message) async {
    final db = await database;
    await db.insert(
      'messages',
      message.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Message>> getMessages() async {
  final db = await database;
  final List<Map<String, dynamic>> maps = await db.query('messages');
  return List.generate(maps.length, (i) {
    return Message(
      maps[i]['text'],
      maps[i]['timestamp'],
      maps[i]['imageBytes'], // Assuming 'imageBytes' is a column in the 'messages' table
    );
  });
}

}

