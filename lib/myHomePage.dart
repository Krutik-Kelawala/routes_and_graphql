import 'package:flutter/material.dart';
import 'package:test_project/routeFile.dart' as router;
import 'package:test_project/utilities/common_logic.dart';
import 'package:test_project/widgets/common_widgets.dart';

class MyHome_Page extends StatefulWidget {
  @override
  State<MyHome_Page> createState() => _MyHome_PageState();
}

class _MyHome_PageState extends State<MyHome_Page> {
  @override
  Widget build(BuildContext context) {
    CommonLogic.initiateHeightWidth(context);
    return Scaffold(
        appBar: CommonWidgets.commonAppBar("My Home Page"),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                const Text('Test project for routes and navigation', textAlign: TextAlign.center),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, router.firstPage);
                        },
                        child: const Text("Go to First Page"))),
                const Text('Dummy GraphQL Data send and show to screen', textAlign: TextAlign.center),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, router.graphQLScreen);
                        },
                        child: const Text("GraphQL Api Demo Screen"))),
                const Text('Hero animation example with using rest api', textAlign: TextAlign.center),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, router.allImageScreen);
                        },
                        child: const Text("Hero Animation"))),
              ])),
        ));
  }
}
