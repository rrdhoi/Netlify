part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PopularMovieLoading extends PopularMoviesState {}

class PopularMovieEmpty extends PopularMoviesState {}

class PopularMovieHasData extends PopularMoviesState {
  final List<Movie> movies;
  PopularMovieHasData(this.movies);

  @override
  List<Object?> get props => [movies];
}

class PopularMovieError extends PopularMoviesState {
  final String message;
  PopularMovieError(this.message);

  @override
  List<Object?> get props => [message];
}
