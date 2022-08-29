import "package:flutter/material.dart";

import "router.dart";
import "package:noted/internal/goals.dart";

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    var keys = userGoals.keys.toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text("View Goals"),
          automaticallyImplyLeading: true,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              // TODO go to create goal page
              onPressed: () {},
            ),
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
