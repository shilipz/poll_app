part of 'fetch_poll_bloc.dart';

class FetchPollState {}

final class FetchPollInitial extends FetchPollState {}

final class FetchPollFailure extends FetchPollState {
  final String errorMessage;

  FetchPollFailure(this.errorMessage);
}

final class FetchPollSuccess extends FetchPollState {
  final List<Datum> polls;

  FetchPollSuccess(this.polls);
}
