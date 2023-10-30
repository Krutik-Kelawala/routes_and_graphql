import 'package:flutter/material.dart';
import 'package:test_project/routeFile.dart' as router;

class third_Page extends StatefulWidget {
  const third_Page({super.key});

  @override
  State<third_Page> createState() => _third_PageState();
}

class _third_PageState extends State<third_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("third Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, router.homePage, (route) => false);
            },
            child: const Text("Go to Dashboard")),
      ),
    );
  }
}
