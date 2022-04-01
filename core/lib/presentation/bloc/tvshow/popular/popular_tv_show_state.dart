part of 'popular_tv_show_bloc.dart';

abstract class PopularTvShowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PopularLoading extends PopularTvShowState {}

class PopularEmpty extends PopularTvShowState {}

class PopularHasData extends PopularTvShowState {
  final List<TvShow> tvShows;
  PopularHasData(this.tvShows);

  @override
  List<Object?> get props => [tvShows];
}

class PopularError extends PopularTvShowState {
  final String message;
  PopularError(this.message);

  @override
  List<Object?> get props => [message];
}
