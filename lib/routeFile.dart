import 'package:flutter/material.dart';
import 'package:test_project/firstPage.dart';
import 'package:test_project/myHomePage.dart';
import 'package:test_project/screens/demo_GraphQlData_Screen/graphQl_Demo_Screen.dart';
import 'package:test_project/screens/graphQl_mutation/graphQl_mutation.dart';
import 'package:test_project/secondPage.dart';
import 'package:test_project/thirdPage.dart';

const String homePage = '/';
const String firstPage = 'firstPage';
const String secondPage = 'secondPage';
const String thirdPage = 'thirdPage';
const String graphQLScreen = 'graphQL_Screen';
const String mutationScreen = 'mutation_Screen'; // for send data to server side

Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => MyHome_Page());
    case firstPage:
      return MaterialPageRoute(builder: (context) => const first_Page());
    case secondPage:
      return MaterialPageRoute(
          builder: (context) => second_Page(
                argument: settings.arguments!,
              ));
    case thirdPage:
      return MaterialPageRoute(builder: (context) => const third_Page());

    case graphQLScreen:
      return MaterialPageRoute(builder: (context) => const GraphQlDemoScreen());
    case mutationScreen:
      return MaterialPageRoute(builder: (context) => const GraphQlMutation());
    default:
      return MaterialPageRoute(builder: (context) => MyHome_Page());
  }
}
