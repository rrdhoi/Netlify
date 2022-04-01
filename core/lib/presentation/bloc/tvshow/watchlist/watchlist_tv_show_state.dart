part of 'watchlist_tv_show_bloc.dart';

abstract class WatchlistTvShowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WatchlistLoading extends WatchlistTvShowState {}

class WatchlistEmpty extends WatchlistTvShowState {}

class WatchlistHasData extends WatchlistTvShowState {
  final List<TvShow> tvShows;
  WatchlistHasData(this.tvShows);

  @override
  List<Object?> get props => [tvShows];
}

class WatchlistError extends WatchlistTvShowState {
  final String message;
  WatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}
