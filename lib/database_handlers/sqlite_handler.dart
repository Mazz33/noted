import "dart:async";

import "package:flutter/widgets.dart";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

import "package:noted/notes.dart";

class NoteHandler {
  late String title, content;
  late bool isLocked, isArchived;
  late int id;
  late DateTime dateCreated, dateLastEdited;

  NoteHandler(Note nt) {
    id = nt.id;
    title = nt.title;
    content = nt.content;
    isLocked = nt.isLocked;
    isArchived = nt.isArchived;
    dateCreated = nt.dateCreated;
    dateLastEdited = nt.dateLastEdited;
  }

  void initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(join(await getDatabasesPath(), "notes.db"),
        onCreate: (db, version) => db.execute(
            "CREATE TABLE Notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT"),
        version: 1);
  }

  Future<void> insertNote(Note nt, database) async {
    final db = await database;

    await db.insert(
      "Notes",
      nt.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Note>> getAllNotes(database) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query("Notes");

    return List.generate(maps.length, (index) => Note(maps[index]["id"]));
  }

  Future<void> updateNote(Note nt, database) async {
    final db = await database;

    await db.update(
      "Notes",
      nt.toMap(),
      where: "id = ?",
      whereArgs: [nt.id],
    );
  }

  Future<void> deleteNote(int id, database) async {
    final db = await database;

    await db.delete(
      "Notes",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
