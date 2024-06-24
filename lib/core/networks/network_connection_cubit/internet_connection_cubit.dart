import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit() : super(InternetConnectionInitial());

  StreamSubscription? _subscription;

  void monitorInternetConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          switch (result) {
            case ConnectivityResult.wifi:
            case ConnectivityResult.mobile:
              emit(InternetConnectionConnected());
              break;
            case ConnectivityResult.none:
              emit(InternetConnectionDisconnected());
              break;
            default:
              emit(InternetConnectionDisconnected());
              break;
          }
        } as void Function(List<ConnectivityResult> event)?);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
