part of 'top_rated_tv_show_bloc.dart';

abstract class TopRatedTvShowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopRatedLoading extends TopRatedTvShowState {}

class TopRatedEmpty extends TopRatedTvShowState {}

class TopRatedHasData extends TopRatedTvShowState {
  final List<TvShow> tvShows;
  TopRatedHasData(this.tvShows);

  @override
  List<Object?> get props => [tvShows];
}

class TopRatedError extends TopRatedTvShowState {
  final String message;
  TopRatedError(this.message);

  @override
  List<Object?> get props => [message];
}
