import "package:flutter/material.dart";

import "package:noted/pages/router.dart";

void main() async {
  runApp(const Noted());
}

class Noted extends StatelessWidget {
  const Noted({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Noted",
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const MainMenu(),
          "/Notes": (context) => const NotesPage(),
          "/Notes/CreateNote": (context) => const CreateNotePage(),
          "/Journal": (context) => const JournalPage(),
          "/Settings": (context) => const MainSettingsPage(),
          "/Goals": (context) => const GoalsPage(),
        });
  }
}
