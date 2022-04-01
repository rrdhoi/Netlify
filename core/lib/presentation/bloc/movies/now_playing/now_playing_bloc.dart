import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final GetNowPlayingMovies _nowPlayingMovies;

  NowPlayingBloc(this._nowPlayingMovies) : super(NowPlayingMovieEmpty()) {
    on<FetchNowPlayingMovie>((event, emit) async {
      emit(NowPlayingMovieLoading());
      final result = await _nowPlayingMovies.execute();
      result.fold((failure) {
        emit(NowPlayingMovieError(failure.message));
      }, (data) {
        emit(NowPlayingMovieHasData(data));
      });
    });
  }
}
