part of 'search_tv_show_bloc.dart';

abstract class SearchTvShowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchTvShowEmpty extends SearchTvShowState {}

class SearchTvShowLoading extends SearchTvShowState {}

class SearchTvShowHasData extends SearchTvShowState {
  final List<TvShow> tvShow;

  SearchTvShowHasData(this.tvShow);

  @override
  List<Object?> get props => [tvShow];
}

class SearchTvShowError extends SearchTvShowState {
  final String message;

  SearchTvShowError(this.message);

  @override
  List<Object> get props => [message];
}
