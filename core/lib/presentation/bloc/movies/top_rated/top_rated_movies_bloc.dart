import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/movie.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetTopRatedMovies _topRatedMovies;
  TopRatedMoviesBloc(this._topRatedMovies) : super(TopRatedMovieEmpty()) {
    on<FetchTopRatedMovies>((event, emit) async {
      emit(TopRatedMovieLoading());
      final result = await _topRatedMovies.execute();
      result.fold((failure) {
        emit(TopRatedMovieError(failure.message));
      }, (data) {
        emit(TopRatedMovieHasData(data));
      });
    });
  }
}
