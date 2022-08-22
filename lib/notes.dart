import "package:flutter/material.dart";

var userNotes = {};

// Main Note class
class Note {
  late String title;
  late bool isLocked;

  Note.titledNote(this.title);

  Note() {
    title = "Untitled";
  }

  // Temp locking/unlocking function. No actual encryption yet.
  void lockNote() {
    if (!isLocked) {
      isLocked = true;
    }
  }

  void unlockNote() {
    if (isLocked) {
      isLocked = false;
    }
  }

  set noteTitle(String title) {
    this.title = title;
  }
  String get noteTitle {
    return title;
  }

  set noteLock(bool lock) {
    isLocked = lock;
  }
  bool get noteLock {
    return isLocked;
  }
}

class NoteViewer extends StatefulWidget {
  final Note currentNote;

  const NoteViewer(this.currentNote, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NoteViewerState(currentNote);
  }
}

class _NoteViewerState extends State<NoteViewer> {
  Note currentNote;

  _NoteViewerState(this.currentNote);

  @override
  Widget build(BuildContext context) {
    return ListTile();

  }

}

class NoteManager {
  void addNote(Note newNote) {
    String title = newNote.title;
    if (!userNotes.containsKey(title)) {
      userNotes[title] = newNote;
    }
  }

  void deleteNote(Note delNote) {
    String title = delNote.title;
    if (userNotes.containsKey(title)) {
      userNotes.remove(title);
    }
  }
}