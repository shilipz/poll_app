import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poll_app/core/utils/show_snackbar.dart';
import 'package:poll_app/features/new_poll/domain/functions/functions.dart';

part 'newpoll_event.dart';
part 'newpoll_state.dart';

class NewpollBloc extends Bloc<NewpollEvent, NewpollState> {
  PostDataRepo postDataRepo = PostDataRepo();
  final BuildContext context;

  NewpollBloc(this.context) : super(NewpollInitial()) {
    on<PostNewPoll>((event, emit) async {
      Map<String, dynamic> postResult = await postDataRepo.postData(
          event.topic, event.statement, event.options!, event.pollType);
      if (postResult['success']) {
        emit(NewpollSuccess('Data Posted Successfully'));
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Data posted successfully');
      } else {
        emit(NewpollFailure(postResult['reason']));
      }
    });
  }
}
