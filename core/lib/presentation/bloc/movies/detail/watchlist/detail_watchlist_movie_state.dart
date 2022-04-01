part of 'detail_watchlist_movie_bloc.dart';

abstract class DetailWatchlistMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailWatchlistMovieEmpty extends DetailWatchlistMovieState {}

class IsAddedToWatchlistMovie extends DetailWatchlistMovieState {
  final bool isAdded;
  IsAddedToWatchlistMovie(this.isAdded);

  @override
  List<Object?> get props => [isAdded];
}

class DetailWatchlistMovieStatus extends DetailWatchlistMovieState {
  final String message;
  DetailWatchlistMovieStatus(this.message);

  @override
  List<Object?> get props => [message];
}
