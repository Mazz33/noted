import "package:flutter/material.dart";

import "router.dart";
import "../internal/notes.dart";

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    var keys = userNotes.keys.toList();
    return Scaffold(
        appBar: AppBar(
            title: const Text("My Notes"),
            elevation: 1,
            centerTitle: true,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: "Go Back",
                onPressed: () {
                  router.goBack(context);
                },
              );
            }),
            backgroundColor: const Color.fromRGBO(0xFF, 0, 0, 1),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: "Create a new note",
                onPressed: () {
                  router.loadPage(context, "/Notes/CreateNote");
                },
              )
            ]),
        body: SafeArea(
          right: true,
          left: true,
          top: true,
          bottom: true,
          child: ListView.builder(
              itemCount: keys.length,
              itemBuilder: (BuildContext context, int index) =>
                  NoteViewer(userNotes[keys[index]])),
        ));
  }
}

class CreateNotePage extends StatelessWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      ),
    );
  }
}
