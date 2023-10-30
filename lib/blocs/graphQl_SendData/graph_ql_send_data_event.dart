part of 'graph_ql_send_data_bloc.dart';

@immutable
abstract class GraphQlSendDataEvent {}

class sendData extends GraphQlSendDataEvent {
  final String userEmail;
  final String userName;
  final String userPassword;
  final String imageUrl;

  sendData(this.userEmail, this.userName, this.userPassword, this.imageUrl);
}

