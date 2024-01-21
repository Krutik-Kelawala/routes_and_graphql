import 'package:flutter/material.dart';
import 'package:test_project/firstPage.dart';
import 'package:test_project/myHomePage.dart';
import 'package:test_project/screens/demo_GraphQlData_Screen/graphQl_Demo_Screen.dart';
import 'package:test_project/screens/graphQl_mutation/graphQl_mutation.dart';
import 'package:test_project/screens/hero_animation/image_detail.dart';
import 'package:test_project/screens/hero_animation/image_list.dart';
import 'package:test_project/secondPage.dart';
import 'package:test_project/thirdPage.dart';

const String homePage = '/';
const String firstPage = 'firstPage';
const String secondPage = 'secondPage';
const String thirdPage = 'thirdPage';
const String graphQLScreen = 'graphQL_Screen';
const String mutationScreen = 'mutation_Screen'; // for send data to server side
const String allImageScreen = 'all_image_screen';
const String imageDetailScreen = 'image_detail_screen';

Route<dynamic> routeController(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => MyHome_Page());

    case firstPage:
      return MaterialPageRoute(builder: (context) => const first_Page());

    case secondPage:
      return MaterialPageRoute(builder: (context) => second_Page(argument: settings.arguments!));

    case thirdPage:
      return MaterialPageRoute(builder: (context) => const third_Page());

    case graphQLScreen:
      return MaterialPageRoute(builder: (context) => const GraphQlDemoScreen());

    case mutationScreen:
      return MaterialPageRoute(builder: (context) => const GraphQlMutation());

    case allImageScreen:
      return MaterialPageRoute(builder: (context) => const ImageListScreen());

    case imageDetailScreen:
      List<dynamic>? courseArgument = settings.arguments as List?;
      return MaterialPageRoute(builder: (context) => ImageDetailScreen(imageDetailRes: courseArgument![0], index: courseArgument[1]));

    default:
      return MaterialPageRoute(builder: (context) => MyHome_Page());
  }
}
