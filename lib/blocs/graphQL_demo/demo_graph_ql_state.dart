part of 'demo_graph_ql_bloc.dart';

@immutable
abstract class DemoGraphQlState {}

class DemoGraphQlInitial extends DemoGraphQlState {}

class DemoGraphQlLoaded extends DemoGraphQlState {
  final GraphqlDemoModel graphqlDemoModel;
   final DeleteUserModel? deleteUserModel;

  DemoGraphQlLoaded(this.graphqlDemoModel,{this.deleteUserModel});
}

class DemoGraphQlLoading extends DemoGraphQlState {}

class DemoGraphQlError extends DemoGraphQlState {}
