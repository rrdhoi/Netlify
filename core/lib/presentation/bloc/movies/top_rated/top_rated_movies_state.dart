part of 'top_rated_movies_bloc.dart';

abstract class TopRatedMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopRatedMovieLoading extends TopRatedMoviesState {}

class TopRatedMovieEmpty extends TopRatedMoviesState {}

class TopRatedMovieHasData extends TopRatedMoviesState {
  final List<Movie> movies;
  TopRatedMovieHasData(this.movies);

  @override
  List<Object?> get props => [movies];
}

class TopRatedMovieError extends TopRatedMoviesState {
  final String message;
  TopRatedMovieError(this.message);

  @override
  List<Object?> get props => [message];
}
