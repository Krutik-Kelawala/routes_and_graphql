part of 'demo_graph_ql_bloc.dart';

@immutable
abstract class DemoGraphQlEvent {}

class getProductData extends DemoGraphQlEvent {
  final int pageLimit;

  getProductData(this.pageLimit);
}


class deleteUserData extends DemoGraphQlEvent {
  final String userId;

  deleteUserData(this.userId);
}