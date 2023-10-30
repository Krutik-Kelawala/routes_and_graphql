import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:test_project/graphQl_Query/graphQl_Query_Class.dart';
import 'package:test_project/models/sendDataModel/graphQl_SendData.dart';
import 'package:test_project/repository/repository.dart';
import 'package:test_project/widgets/common_widgets.dart';

part 'graph_ql_send_data_event.dart';

part 'graph_ql_send_data_state.dart';

class GraphQlSendDataBloc extends Bloc<GraphQlSendDataEvent, GraphQlSendDataState> {
  GraphQlSendDataBloc() : super(GraphQlSendDataInitial()) {
    on<GraphQlSendDataEvent>((event, emit) async {
      if (event is sendData) {
        emit(GraphQlSendDataLoading());
        CommonWidgets.printFunction("send Data bloc called");
        final response = await Repository.client.query(QueryOptions(document: gql(GraphQl_Query.sendUserData(event.userEmail, event.userName, event.userPassword, event.imageUrl))));
        if (response.hasException) {
          CommonWidgets.printFunction("Error ${response.exception!.graphqlErrors[0].message}");
        } else {
          CommonWidgets.printFunction("response data ${response.data}");
          emit(GraphQlSendDataLoaded(SendDataDemoModel.fromJson(response.data!)));
        }
      }
    });
  }
}
