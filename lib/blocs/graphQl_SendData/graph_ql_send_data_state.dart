part of 'graph_ql_send_data_bloc.dart';

@immutable
abstract class GraphQlSendDataState {}

class GraphQlSendDataInitial extends GraphQlSendDataState {}

class GraphQlSendDataLoaded extends GraphQlSendDataState {
  final SendDataDemoModel sendDataDemoModel;

  GraphQlSendDataLoaded(this.sendDataDemoModel);
}

class GraphQlSendDataLoading extends GraphQlSendDataState {}

class GraphQlSendDataError extends GraphQlSendDataState {}
