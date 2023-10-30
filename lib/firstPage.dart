import 'package:flutter/material.dart';
import 'package:test_project/routeFile.dart' as router;

class first_Page extends StatefulWidget {
  const first_Page({super.key});

  @override
  State<first_Page> createState() => _first_PageState();
}

class _first_PageState extends State<first_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page"), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, router.secondPage, arguments: "data passed to second screen");
            },
            child: const Text("Go to Second Page")),
      ),
    );
  }
}
