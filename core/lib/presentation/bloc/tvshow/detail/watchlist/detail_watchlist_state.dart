part of 'detail_watchlist_bloc.dart';

abstract class DetailWatchlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailWatchListEmpty extends DetailWatchlistState {
  @override
  List<Object> get props => [];
}

class IsAddedToWatchList extends DetailWatchlistState {
  final bool isAdded;
  IsAddedToWatchList(this.isAdded);

  @override
  List<Object?> get props => [isAdded];
}

class DetailWatchlistStatus extends DetailWatchlistState {
  final String message;
  DetailWatchlistStatus(this.message);

  @override
  List<Object?> get props => [message];
}
