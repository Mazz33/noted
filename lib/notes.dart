import "package:flutter/material.dart";

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
