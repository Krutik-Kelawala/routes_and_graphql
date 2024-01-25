import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/models/imageDataModel/image_data.dart';
import 'package:test_project/widgets/common_widgets.dart';

class Repository {
  static final HttpLink httpLink = HttpLink(dotenv.env['graphQlApi'].toString());

  static GraphQLClient client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        mutate: Policies(cacheReread: CacheRereadPolicy.ignoreAll, fetch: FetchPolicy.noCache),
        query: Policies(cacheReread: CacheRereadPolicy.ignoreAll, fetch: FetchPolicy.noCache),
      ));

  static Future<ImageDataModel?> getImageData() async {
    final response = await http.get(Uri.parse(dotenv.env['dummyApi'].toString()));

    try {
      if (response.statusCode == 200) {
        ImageDataModel imageDataResponse = ImageDataModel.fromJson(jsonDecode(response.body));
        // CommonWidgets.printFunction("Image Data res ${response.body}");
        CommonWidgets.printFunction("Image Data res ${imageDataResponse.photos}");
        return imageDataResponse;
      } else {
        CommonWidgets.printFunction("image data error ${response.statusCode}");
      }
    } catch (e, stacktrace) {
      CommonWidgets.printFunction("image catch error ${e.toString()} stacktrace ${stacktrace.toString()}");
    }
    return null;
  }
}
