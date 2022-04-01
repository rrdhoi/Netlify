import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_tv_show_event.dart';
part 'watchlist_tv_show_state.dart';

class WatchlistTvShowBloc
    extends Bloc<WatchlistTvShowEvent, WatchlistTvShowState> {
  final GetWatchlistTvShow _getWatchlistTvShow;

  WatchlistTvShowBloc(this._getWatchlistTvShow) : super(WatchlistEmpty()) {
    on<FetchWatchlistTvShow>((event, emit) async {
      emit(WatchlistLoading());
      final result = await _getWatchlistTvShow.execute();
      result.fold((failure) {
        emit(WatchlistError(failure.message));
      }, (data) {
        emit(WatchlistHasData(data));
      });
    });
  }
}
