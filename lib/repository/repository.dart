import 'package:graphql_flutter/graphql_flutter.dart';

class Repository {

  static final HttpLink httpLink = HttpLink('https://api.escuelajs.co/graphql');

  static GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
}
