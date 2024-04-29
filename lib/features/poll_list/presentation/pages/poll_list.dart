import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poll_app/core/theme/app_palette.dart';
import 'package:poll_app/features/poll_list/domain/functions/functions.dart';
import 'package:poll_app/features/poll_list/presentation/bloc/fetch_poll_bloc.dart';
import 'package:poll_app/features/poll_list/presentation/widget/poll_list_widget.dart';

class PollList extends StatefulWidget {
  const PollList({super.key});

  @override
  State<PollList> createState() => _PollListState();
}

class _PollListState extends State<PollList> {
  @override
  void initState() {
    context.read<FetchPollBloc>().add(FetchPollEvent());
    super.initState();
  }

  final FetchPollData fetchPollData = FetchPollData();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('All Polls', style: AppPalette.appbarText),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppPalette.gradient1, AppPalette.gradient2],
              ),
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 10),
          child: BlocBuilder<FetchPollBloc, FetchPollState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.polls.length,
                itemBuilder: (context, index) {
                  final pollData = state.polls[index];
                  return PollGrids(
                    noOfLikes: pollData.noOfLikes,
                    comments: pollData.comments,
                    id: pollData.id,
                    textOptions: pollData.textOptions,
                    topic: pollData.topic!,
                    statement: pollData.statement!,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
