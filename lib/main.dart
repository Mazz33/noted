import 'package:flutter/material.dart';
import "pages.dart";
import "goals.dart";

void main() {
  runApp(const Noted());
}

class Noted extends StatelessWidget {
  const Noted({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Noted", initialRoute: "/", routes: {
      "/": (context) => const MainMenu(),
      "/Notes": (context) => const NotesPage(),
      "/Journal": (context) => const JournalPage(),
      "/Settings": (context) => const SettingsPage(),
      "/Goals": (context) => const GoalsPage(),
      "/Goals/ViewGoal": (context) => const ViewGoals(),
    });
  }
}

