part of 'popular_tv_show_bloc.dart';

abstract class PopularTvShowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPopularTvShow extends PopularTvShowEvent {}
