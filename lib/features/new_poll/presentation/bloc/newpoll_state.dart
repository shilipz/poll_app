part of 'newpoll_bloc.dart';

class NewpollState {}

final class NewpollInitial extends NewpollState {}

final class NewpollLoading extends NewpollState {}

final class NewpollSuccess extends NewpollState {
  final String message;
  NewpollSuccess(this.message);
}

final class NewpollFailure extends NewpollState {
  final String failMessage;

  NewpollFailure(this.failMessage);
}
