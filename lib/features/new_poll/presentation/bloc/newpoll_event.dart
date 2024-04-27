part of 'newpoll_bloc.dart';

@immutable
sealed class NewpollEvent {}

final class PostNewPoll extends NewpollEvent {
  final String topic;
  final String statement;
  final String pollType;

  final List<String>? options;

  PostNewPoll(this.topic, this.statement, this.pollType, this.options);
}
