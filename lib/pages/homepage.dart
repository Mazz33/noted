import "package:flutter/material.dart";

import "package:noted/pages/router.dart";

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
