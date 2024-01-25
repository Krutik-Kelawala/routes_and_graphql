import 'package:flutter/material.dart';
import 'package:test_project/myHomePage.dart';
import 'package:test_project/routeFile.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO When app page load performance show in real device uncommet below line
       // showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: router.routeController,
        initialRoute: router.homePage,
        theme: ThemeData(useMaterial3: true),
        home: MyHome_Page());
  }
}
