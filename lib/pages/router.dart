import "package:flutter/material.dart";

export "homepage.dart";
export "notes_pages.dart";
export "goals_pages.dart";
export "journal_pages.dart";
export "settings_pages.dart";

RoutesManager router = RoutesManager();

class RoutesManager {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void loadPage(BuildContext context, String pageName) {
    Navigator.pushNamed(context, pageName);
  }
}

