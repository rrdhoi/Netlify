import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies _popularMovies;

  PopularMoviesBloc(this._popularMovies) : super(PopularMovieEmpty()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMovieLoading());
      final result = await _popularMovies.execute();
      result.fold((failure) {
        emit(PopularMovieError(failure.message));
      }, (data) {
        emit(PopularMovieHasData(data));
      });
    });
  }
}
