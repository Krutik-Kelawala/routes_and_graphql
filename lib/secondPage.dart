import 'package:flutter/material.dart';
import 'package:test_project/routeFile.dart' as router;

class second_Page extends StatefulWidget {
  final Object argument;

  second_Page({super.key, required this.argument});

  @override
  State<second_Page> createState() => _second_PageState();
}

class _second_PageState extends State<second_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, router.thirdPage);
                },
                child: Text("Go to Third page", textAlign: TextAlign.center)),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("show passed text ${widget.argument}", textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
