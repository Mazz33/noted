import "dart:async";

import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

import "package:noted/notes.dart";

class NoteDatabaseHandler {
  final databaseName = "notes.db";
  final tableName = "notes";

  static late Database _database;

  final fieldMap = {
    "id": "INTEGER PRIMARY KEY AUTOINCREMENT",
    "title": "BLOB",
    "content": "BLOB",
    "dateCreated": "INTEGER",
    "dateLastEdited": "INTEGER",
    "isArchived": "INTEGER",
    "isLocked": "INTEGER"
  };

  NoteDatabaseHandler() {
    _database = initDatabase();
  }

  initDatabase() async {
    String dbPath = join(await getDatabasesPath(), databaseName);
    Database dbConnection = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(_buildCreateQuery());
    });

    await dbConnection.execute(_buildCreateQuery());
    return dbConnection;
  }

  // Generate the CREATE TABLE query from the fields in fieldMap
  String _buildCreateQuery() {
    String query = "CREATE TABLE IF NOT EXISTS ";
    query += "$tableName(";
    fieldMap.forEach((key, value) {
      query += "$key $value";
    });
    query = query.substring(0, query.length - 1);
    query += ")";

    return query;
  }

  Future<Database> get database async => _database;

  Future<String> databasePath() async {
    String path = await getDatabasesPath();
    return path;
  }

  Future<List<Note>> getAllNotes() async {
    final db = _database;
    final List<Map<String, dynamic>> maps = await db.query("Notes");

    return List.generate(maps.length, (index) => Note(maps[index]["id"]));
  }

  Future<void> insertNote(Note nt) async {
    final db = _database;

    await db.insert(
      "Notes",
      nt.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> copyNote(Note nt) async {
    try {
      insertNote(nt);
    } catch (e) {
      print("Error inserting ${nt.id}\nError is: $e");
    }
  }

  Future<void> updateNote(Note nt) async {
    final db = _database;

    await db.update(
      "Notes",
      nt.toMap(),
      where: "id = ?",
      whereArgs: [nt.id],
    );
  }

  Future<void> deleteNote(int id) async {
    final db = _database;

    await db.delete(
      "Notes",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
