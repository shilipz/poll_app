part of 'fetch_poll_bloc.dart';

class FetchPollState {
  final List<Datum> polls;

  FetchPollState(this.polls);
}

final class FetchPollInitial extends FetchPollState {
  FetchPollInitial(super.polls);
}
