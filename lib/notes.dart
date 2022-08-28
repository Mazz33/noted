import 'dart:convert';

import "package:flutter/material.dart";

var userNotes = {};

// Main Note class
class Note {
  late String title, content;
  late bool isLocked, isArchived;
  late final int id;
  late DateTime dateCreated, dateLastEdited;

  Note.titledNote(this.title, this.id) {
    isLocked = false;
    isArchived = false;
    dateCreated = DateTime.now();
    dateLastEdited = DateTime.now();
  }

  Note(this.id) {
    title = "Untitled";
    isLocked = false;
    isArchived = false;
    dateCreated = DateTime.now();
    dateLastEdited = DateTime.now();
  }

  // Get the parameters of the note as map object
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": utf8.encode(title),
        "content": utf8.encode(content),
        "dateCreated": getEpochSeconds(dateCreated),
        "dateLastEdited": getEpochSeconds(dateLastEdited),
        "isLocked": isLocked,
        "isArchived": isArchived
      };

  @override
  String toString() =>
      "Title: $title\nDate Created: ${dateCreated.toString()}\nArchived: ${isArchived ? "Yes" : "No"}";

  int getEpochSeconds(DateTime dt) => dt.millisecondsSinceEpoch ~/ 1000;

  // Temp locking/unlocking function. No actual encryption yet.
  void lockNote() => isLocked = true;

  void unlockNote() => isLocked = false;

  void archiveNote() => isArchived = true;

  void unarchiveNote() => isArchived = false;

  // Setters/Getters
  int get noteId => id;

  set noteTitle(String title) => this.title = title;

  String get noteTitle => title;

  set noteContent(String content) => this.content = content;

  String get noteContent => content;

  DateTime get noteDateCreated => dateCreated;

  set noteDateLastEdited(DateTime dt) => dateLastEdited = dt;

  DateTime get noteDateLastEdited => dateLastEdited;

  set noteLock(bool lock) => isLocked = lock;

  bool get noteLock => isLocked;

  set noteArchive(bool isArchived) => this.isArchived = isArchived;

  bool get noteArchive => isArchived;
}

class NoteViewer extends StatefulWidget {
  final Note currentNote;

  const NoteViewer(this.currentNote, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoteViewerState();
}

class _NoteViewerState extends State<NoteViewer> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _titleFocus = FocusNode();
  final _contentFocus = FocusNode();
  bool _isNewNote = false;

  @override
  void initState() {
    _titleController.text = widget.currentNote.title;
    _contentController.text = widget.currentNote.content;

    // If we pass id as -1 then this is a newly created note.
    if (widget.currentNote.id == -1) _isNewNote = true;
  }

  @override
  Widget build(BuildContext context) {
    return const ListTile();
  }
}

class NoteCreator extends StatelessWidget {
  const NoteCreator({Key? key}) : super(key: key);

  static int lastId = 0;

  // Generate and ID for the note
  int generateId() {
    return ++lastId;
  }

  @override
  Widget build(BuildContext context) {
    /*
    * TODO
    * this needs to return a ready widget class
    * which needs to be a new note page where user can write or draw with pen
     */
    return const Scaffold();
  }
}

class NoteManager {
  void addNote(Note newNote) {
    final int id = newNote.id;
    if (!userNotes.containsKey(id)) {
      userNotes[id] = newNote;
    }
  }

  void deleteNote(Note delNote) {
    final int id = delNote.id;
    if (userNotes.containsKey(id)) {
      userNotes.remove(id);
    }
  }
}
