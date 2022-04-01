part of 'detail_movie_bloc.dart';

abstract class DetailMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailMovieHasData extends DetailMovieState {
  final MovieDetail movie;
  final List<Movie> recommendations;

  DetailMovieHasData(this.movie, this.recommendations);

  @override
  List<Object> get props => [Movie, recommendations];
}

class DetailMovieError extends DetailMovieState {
  final String message;
  DetailMovieError(this.message);

  @override
  List<Object?> get props => [message];
}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieEmpty extends DetailMovieState {}
