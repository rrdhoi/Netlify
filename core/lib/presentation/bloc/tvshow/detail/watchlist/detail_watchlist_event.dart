part of 'detail_watchlist_bloc.dart';

abstract class DetailWatchlistEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadWatchlistStatus extends DetailWatchlistEvent {
  final int id;
  LoadWatchlistStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class AddWatchListEvent extends DetailWatchlistEvent {
  final TvShowDetail tvShowDetail;
  AddWatchListEvent(this.tvShowDetail);

  @override
  List<Object?> get props => [tvShowDetail];
}

class RemoveWatchlistEvent extends DetailWatchlistEvent {
  final TvShowDetail tvShowDetail;
  RemoveWatchlistEvent(this.tvShowDetail);

  @override
  List<Object?> get props => [tvShowDetail];
}
