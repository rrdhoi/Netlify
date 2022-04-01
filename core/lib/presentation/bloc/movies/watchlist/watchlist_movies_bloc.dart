import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_movies_event.dart';
part 'watchlist_movies_state.dart';

class WatchlistMoviesBloc
    extends Bloc<WatchlistMoviesEvent, WatchlistMoviesState> {
  final GetWatchlistMovies _watchlistMovies;

  WatchlistMoviesBloc(this._watchlistMovies) : super(WatchlistMoviesEmpty()) {
    on<FetchWatchlistMovies>((event, emit) async {
      emit(WatchlistMoviesLoading());
      final result = await _watchlistMovies.execute();
      result.fold((failure) {
        emit(WatchlistMoviesError(failure.message));
      }, (data) {
        emit(WatchlistMoviesHasData(data));
      });
    });
  }
}
