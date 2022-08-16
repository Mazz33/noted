import 'package:flutter/material.dart';

void main() {
  runApp(const Noted());
}

class Noted extends StatelessWidget {
  const Noted({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Noted",
      initialRoute: "/",
      routes: {
        "/": (context) => const MainMenu(),
        "/Notes": (context) => const NotesPage(),
        "/Journal": (context) => const JournalPage(),
        "/Settings": (context) => const SettingsPage(),
      }
    );
  }
}

class RoutesManager {

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void loadPage(BuildContext context, String pageName) {
    Navigator.pushNamed(context, pageName);
  }
}

RoutesManager router = RoutesManager();

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                router.loadPage(context, "/");
              },
              tooltip: "Back To Main Menu",
            );
          }
        ),
        backgroundColor: const Color.fromRGBO(0xFF, 0, 0, 1),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Open Settings",
            onPressed: () {},
          )
        ],
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("My Notes"),
          onPressed: () {
            router.loadPage(context, "/Notes");
          }
        )
      ),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Notes"),
        ),
        body: const Center(
            child: Text("My Notes")
        )
    );
  }
}

class JournalPage extends StatefulWidget {
  const JournalPage({Key? key}) : super(key: key);

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Journal"),
      ),
      body: const Center(
        child: Text("My Journal")
      )
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      )
    );
  }
}
