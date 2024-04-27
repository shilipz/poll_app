import 'package:bloc/bloc.dart';
import 'package:poll_app/features/new_poll/data/models/poll_model/datum.dart';
import 'package:poll_app/features/poll_list/domain/functions/functions.dart';
part 'fetch_poll_event.dart';
part 'fetch_poll_state.dart';

class FetchPollBloc extends Bloc<FetchPollEvent, FetchPollState> {
  final FetchPollData fetchPollData;
  FetchPollBloc(this.fetchPollData) : super(FetchPollInitial([])) {
    on<FetchPollEvent>((event, emit) async {
      await fetchPollData.fetchPolls();
      final polls = await fetchPollData.fetchPolls();
      emit(FetchPollState(polls));
    });
  }
}
