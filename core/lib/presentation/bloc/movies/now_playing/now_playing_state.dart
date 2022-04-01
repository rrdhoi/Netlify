part of 'now_playing_bloc.dart';

abstract class NowPlayingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NowPlayingMovieLoading extends NowPlayingState {}

class NowPlayingMovieEmpty extends NowPlayingState {}

class NowPlayingMovieHasData extends NowPlayingState {
  final List<Movie> movies;
  NowPlayingMovieHasData(this.movies);

  @override
  List<Object?> get props => [movies];
}

class NowPlayingMovieError extends NowPlayingState {
  final String message;
  NowPlayingMovieError(this.message);

  @override
  List<Object?> get props => [message];
}
