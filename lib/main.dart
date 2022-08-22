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
    final testGoal = new Goal("Test", "Test goal");
    final testGoal2 = new Goal("Test2", "Test goal2");
    GoalManager().addGoal(testGoal);
    GoalManager().addGoal(testGoal2);
    return MaterialApp(title: "Noted", initialRoute: "/", routes: {
      "/": (context) => const MainMenu(),
      "/Notes": (context) => const NotesPage(),
      "/Notes/CreateNote": (context) => const CreateNotePage(),
      "/Journal": (context) => const JournalPage(),
      "/Settings": (context) => const SettingsPage(),
      "/Goals": (context) => const GoalsPage(),
      "/Goals/ViewGoal": (context) => const ViewGoals(),
    });
  }
}

