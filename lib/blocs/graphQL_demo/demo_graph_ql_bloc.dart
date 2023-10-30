import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:test_project/graphQl_Query/graphQl_Query_Class.dart';
import 'package:test_project/models/deleteUserModal/deleteUser.dart';
import 'package:test_project/models/demo_graphQl/GraphQl_Demo.dart';
import 'package:test_project/repository/repository.dart';
import 'package:test_project/widgets/common_widgets.dart';

part 'demo_graph_ql_event.dart';

part 'demo_graph_ql_state.dart';

class DemoGraphQlBloc extends Bloc<DemoGraphQlEvent, DemoGraphQlState> {
  DemoGraphQlBloc() : super(DemoGraphQlInitial()) {
    GraphqlDemoModel? resultData;
    on<DemoGraphQlEvent>((event, emit) async {
      if (event is getProductData) {
        emit(DemoGraphQlLoading());
        CommonWidgets.printFunction("bloc called");
        final response = await Repository.client.query(QueryOptions(document: gql(GraphQl_Query.getData(event.pageLimit))));
        if (response.hasException) {
          CommonWidgets.printFunction("Error ${response.exception!.graphqlErrors[0].message}");
        } else {
          CommonWidgets.printFunction("response data ${response.data}");
          resultData = GraphqlDemoModel.fromJson(response.data!);
          CommonWidgets.printFunction("result ${resultData!.users}");
          emit(DemoGraphQlLoaded(resultData!));
        }
      } else if (event is deleteUserData) {
        emit(DemoGraphQlLoading());
        CommonWidgets.printFunction("delete bloc called");
        final response = await Repository.client.query(QueryOptions(document: gql(GraphQl_Query.deleteUserData(event.userId))));
        if (response.hasException) {
          CommonWidgets.printFunction("Error ${response.exception!.graphqlErrors[0].message}");
        } else {
          DeleteUserModel deleteData = DeleteUserModel.fromJson(response.data!);
          emit(DemoGraphQlLoaded(resultData!, deleteUserModel: deleteData));
          CommonWidgets.printFunction("response data ${deleteData.deleteUser}");
        }
      }
    });
  }
}
