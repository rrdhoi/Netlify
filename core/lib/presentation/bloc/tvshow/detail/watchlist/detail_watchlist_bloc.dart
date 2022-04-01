import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core.dart';

part 'detail_watchlist_event.dart';
part 'detail_watchlist_state.dart';

class DetailWatchlistBloc
    extends Bloc<DetailWatchlistEvent, DetailWatchlistState> {
  final GetWatchlistTvShowStatus _getWatchlistTvShowStatus;
  final SaveWatchlistTvShow _saveWatchlistTvShow;
  final RemoveWatchlistTvShow _removeWatchlistTvShow;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  DetailWatchlistBloc(
    this._getWatchlistTvShowStatus,
    this._saveWatchlistTvShow,
    this._removeWatchlistTvShow,
  ) : super(DetailWatchListEmpty()) {
    on<AddWatchListEvent>((event, emit) async {
      final result = await _saveWatchlistTvShow.execute(event.tvShowDetail);
      result.fold((failure) => emit(DetailWatchlistStatus(failure.message)),
          (successMessage) {
        emit(IsAddedToWatchList(true));
      });
    });

    on<RemoveWatchlistEvent>((event, emit) async {
      final result = await _removeWatchlistTvShow.execute(event.tvShowDetail);
      result.fold((l) => emit(DetailWatchlistStatus(l.message)), (r) {
        emit(IsAddedToWatchList(false));
      });
    });

    on<LoadWatchlistStatus>((event, emit) async {
      final result = await _getWatchlistTvShowStatus.execute(event.id);
      emit(IsAddedToWatchList(result));
    });
  }
}
