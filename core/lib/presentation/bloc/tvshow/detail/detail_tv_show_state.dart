part of 'detail_tv_show_bloc.dart';

abstract class DetailTvShowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailTvShowHasData extends DetailTvShowState {
  final TvShowDetail tvShow;
  final List<TvShow> recommendations;

  DetailTvShowHasData(this.tvShow, this.recommendations);

  @override
  List<Object> get props => [tvShow, recommendations];
}

class DetailTvShowError extends DetailTvShowState {
  final String message;
  DetailTvShowError(this.message);

  @override
  List<Object?> get props => [message];
}

class DetailTvShowLoading extends DetailTvShowState {}

class DetailTvShowEmpty extends DetailTvShowState {}
