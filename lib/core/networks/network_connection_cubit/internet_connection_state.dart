part of 'internet_connection_cubit.dart';

@immutable
sealed class InternetConnectionState {}

final class InternetConnectionInitial extends InternetConnectionState {}

final class InternetConnectionConnected extends InternetConnectionState {}

final class InternetConnectionDisconnected extends InternetConnectionState {}