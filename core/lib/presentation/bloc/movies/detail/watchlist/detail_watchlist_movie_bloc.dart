import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core.dart';

part 'detail_watchlist_movie_event.dart';
part 'detail_watchlist_movie_state.dart';

class DetailWatchlistMovieBloc
    extends Bloc<DetailWatchlistMovieEvent, DetailWatchlistMovieState> {
  final GetWatchListStatus _getWatchlistMovieStatus;
  final SaveWatchlist _saveWatchlistMovie;
  final RemoveWatchlist _removeWatchlistMovie;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  DetailWatchlistMovieBloc(this._getWatchlistMovieStatus,
      this._saveWatchlistMovie, this._removeWatchlistMovie)
      : super(DetailWatchlistMovieEmpty()) {
    on<AddWatchlistMovieEvent>((event, emit) async {
      final result = await _saveWatchlistMovie.execute(event.movieDetail);
      result
          .fold((failure) => emit(DetailWatchlistMovieStatus(failure.message)),
              (successMessage) {
        emit(IsAddedToWatchlistMovie(true));
      });
    });

    on<RemoveWatchlistMovieEvent>((event, emit) async {
      final result = await _removeWatchlistMovie.execute(event.movieDetail);
      result.fold((l) => emit(DetailWatchlistMovieStatus(l.message)), (r) {
        emit(IsAddedToWatchlistMovie(false));
      });
    });

    on<LoadWatchlistMovieStatus>((event, emit) async {
      final result = await _getWatchlistMovieStatus.execute(event.id);
      emit(IsAddedToWatchlistMovie(result));
    });
  }
}
