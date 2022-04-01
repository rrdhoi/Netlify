part of 'watchlist_tv_show_bloc.dart';

abstract class WatchlistTvShowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWatchlistTvShow extends WatchlistTvShowEvent {}
