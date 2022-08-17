import "package:flutter/material.dart";

var userGoals = {};

class Goal {
  late String name, desc;
  bool finished = false;
  bool status = false; //is the goal started or not

  Goal(this.name, this.desc);

  set goalName(String name) => this.name = name;

  String get goalName => name;

  set goalDesc(String desc) => this.desc = desc;

  String get goalDesc => desc;

  void markComplete() => finished = true;

  void markIncomplete() => finished = false;

  void makeActive() => status = true;

  void makeIdle() => status = false;
}

class GoalViewer extends StatefulWidget {
  final Goal currentGoal;

  const GoalViewer(this.currentGoal, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GoalViewerState(currentGoal);
  }
}

class _GoalViewerState extends State<GoalViewer> {
  Goal currentGoal;

  _GoalViewerState(this.currentGoal);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        currentGoal.finished ? Icons.check_box : Icons.cancel,
        color: currentGoal.finished ? Colors.green : Colors.red,
      ),
      title: Text(currentGoal.goalName),
      subtitle: Text(currentGoal.goalDesc),
      isThreeLine: true,
      enabled: true,
      dense: false,
      tileColor: Colors.white12,
      selectedTileColor: Colors.blueAccent,
      selected: currentGoal.status,
      onLongPress: () => {
        setState(() {
          currentGoal.finished = !currentGoal.finished;
        })
      },
      onTap: () => {
        setState(() {
          currentGoal.status = !currentGoal.status;
        })
      },
      trailing: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.blueGrey,
        onPressed: () => {},
      ),
    );
  }
}

class GoalManager {
  Text isActive(Goal g) {
    if (g.status) {
      return const Text("Goal Active!");
    }
    return const Text("Goal Inactive");
  }

  //adds new new goal
  void addGoal(Goal newGoal) {
    String name = newGoal.name;
    //safecheck
    if (!userGoals.containsKey(name)) {
      userGoals[name] = newGoal;
    }
  }

  void markGoalIncomplete(Goal unfinishedGoal) {
    String name = unfinishedGoal.name;
    if (userGoals.containsKey(name)) {
      userGoals[name].markIncomplete();
    }
  }

  void markGoalComplete(Goal finishedGoal) {
    String name = finishedGoal.name;
    if (userGoals.containsKey(name)) {
      userGoals[name].markComplete();
    }
  }

  void markGoalActive(Goal targetGoal) {
    String name = targetGoal.name;
    if (userGoals.containsKey(name)) {
      userGoals[name].makeActive();
    }
  }

  void removeGoal(Goal targetGoal) {
    String name = targetGoal.name;
    if (userGoals.containsKey(name)) {
      userGoals.remove(name);
    }
  }
}
