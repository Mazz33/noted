import "package:flutter/material.dart";
import "notes.dart";
import "goals.dart";

RoutesManager router = RoutesManager();

class RoutesManager {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void loadPage(BuildContext context, String pageName) {
    Navigator.pushNamed(context, pageName);
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              router.loadPage(context, "/");
            },
            tooltip: "Back To Main Menu",
          );
        }),
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
      body: ListView(
        padding: const EdgeInsets.all(10),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const SizedBox(
              height: 200,
              child: Center(
                  child: Text("Write Notes in Better Way!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.5,
                        decorationStyle: TextDecorationStyle.wavy,
                      )))),
          const SizedBox(
              height: 250,
              width: double.infinity,
              child: Center(
                  child: Image(
                      image: AssetImage("images/mainpage_background.jpg")))),
          const SizedBox(
            //Empty box to add space between the picture and the options
            height: 100,
            width: double.infinity,
          ),
          Center(
              child: IntrinsicWidth(
                  stepWidth: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            router.loadPage(context, "/Notes");
                          },
                          child: const Text("Notes")),
                      ElevatedButton(
                          onPressed: () {
                            router.loadPage(context, "/Journal");
                          },
                          child: const Text("Journal")),
                      ElevatedButton(
                          onPressed: () {
                            router.loadPage(context, "/Goals");
                          },
                          child: const Text("Goals"))
                    ],
                  ))),
        ],
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
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // Go to create new notes page
              },
              tooltip: "Go Back",
            );
          }),
          backgroundColor: const Color.fromRGBO(0xFF, 0, 0, 1),
          actions: <Widget> [
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: "Open Settings",
              onPressed: () {
                // Go to settings page
              },
            )
          ]
        ),
        body: const Center(child: Text("My Notes")));
  }
}

class CreateNotePage extends StatelessWidget {
  const CreateNotePage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      ),
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
        body: const Center(child: Text("My Journal")));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Settings"),
    ));
  }
}

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Goals"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewGoals()));
                    },
                    child: const Text("My List",
                        style: TextStyle(fontSize: 35.0)))),
            Center(
                child: TextButton(
              onPressed: () {},
              child: const Text("Add Todo", style: TextStyle(fontSize: 27.0)),
            ))
          ],
        )));
  }
}

class ViewGoals extends StatefulWidget {
  const ViewGoals({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewGoalsState();
}

class _ViewGoalsState extends State<ViewGoals> {
  @override
  Widget build(BuildContext context) {
    var keys = userGoals.keys.toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Goals"),
          automaticallyImplyLeading: true,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoalsPage()))),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: ListView.builder(
            itemCount: keys.length,
            itemBuilder: (BuildContext context, int index) {
              return GoalViewer(userGoals[keys[index]]);
            }));
  }
}
