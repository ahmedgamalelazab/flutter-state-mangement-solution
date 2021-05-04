part of 'internetconnection_cubit.dart';

@immutable
abstract class InternetconnectionState {}

class InternetLoading extends InternetconnectionState {}

class InternetConnected extends InternetconnectionState {
  //payload
  final ConnectionType connectionType;

  InternetConnected({@required this.connectionType});
}

class InternetDisConnected extends InternetconnectionState {}
