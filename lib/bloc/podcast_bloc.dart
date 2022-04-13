import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:podcast/models/podcast_model.dart';
import 'package:podcast/resources/api_provider.dart';

part 'podcast_event.dart';
part 'podcast_state.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  PodcastBloc() : super(PodcastInitial()) {
    on<PodcastEvent>((event, emit) async {
      try {
        emit(PodcasLoading());
        List<PodcastModel> mlist = await ApiProvider().fetchdata();
        emit(PodcastSuccess(mlist));
      } catch (e) {
        emit(PodcastError(e.toString()));
      }
    });
  }
}
