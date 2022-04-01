part of 'top_rated_tv_show_bloc.dart';

abstract class TopRatedTvShowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTopRatedTvShow extends TopRatedTvShowEvent {}
