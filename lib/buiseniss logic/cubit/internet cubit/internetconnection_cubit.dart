import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:redux_project/constant/enums/connectionType.dart';

part 'internetconnection_state.dart';

class InternetconnectionCubit extends Cubit<InternetconnectionState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscribtion;

  InternetconnectionCubit({@required this.connectivity})
      : super(InternetLoading()) {
    connectivityStreamSubscribtion =
        connectivity.onConnectivityChanged.listen((connectionResult) {
      if (connectionResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectionResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectionResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  /// this function emits a new state tells the listener that we have connection with connection type
  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  ///this function emits a new state for the connection tells the listener that we are disconnected
  void emitInternetDisconnected() => emit(InternetDisConnected());

  @override
  Future<void> close() {
    connectivityStreamSubscribtion.cancel();
    return super.close();
  }
}
