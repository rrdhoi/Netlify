part of 'on_the_air_tv_show_bloc.dart';

abstract class OnTheAirTvShowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnTheAirTvShowLoading extends OnTheAirTvShowState {}

class OnTheAirTvShowEmpty extends OnTheAirTvShowState {}

class OnTheAirTvShowHasData extends OnTheAirTvShowState {
  final List<TvShow> tvShows;
  OnTheAirTvShowHasData(this.tvShows);

  @override
  List<Object?> get props => [tvShows];
}

class OnTheAirTvShowError extends OnTheAirTvShowState {
  final String message;
  OnTheAirTvShowError(this.message);

  @override
  List<Object?> get props => [message];
}
