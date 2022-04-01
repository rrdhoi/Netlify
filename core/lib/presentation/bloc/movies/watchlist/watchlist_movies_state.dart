part of 'watchlist_movies_bloc.dart';

abstract class WatchlistMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WatchlistMoviesLoading extends WatchlistMoviesState {}

class WatchlistMoviesEmpty extends WatchlistMoviesState {}

class WatchlistMoviesHasData extends WatchlistMoviesState {
  final List<Movie> movies;
  WatchlistMoviesHasData(this.movies);

  @override
  List<Object?> get props => [movies];
}

class WatchlistMoviesError extends WatchlistMoviesState {
  final String message;
  WatchlistMoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
