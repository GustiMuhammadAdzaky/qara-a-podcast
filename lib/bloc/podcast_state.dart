part of 'podcast_bloc.dart';

abstract class PodcastState extends Equatable {
  const PodcastState();

  @override
  List<Object> get props => [];
}

class PodcastInitial extends PodcastState {}

class PodcasLoading extends PodcastState {}

class PodcastSuccess extends PodcastState {
  final List<PodcastModel> podcastModel;
  const PodcastSuccess(this.podcastModel);
}

class PodcastError extends PodcastState {
  final String? message;
  const PodcastError(this.message);
}
