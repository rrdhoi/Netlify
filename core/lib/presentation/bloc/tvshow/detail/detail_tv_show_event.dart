part of 'detail_tv_show_bloc.dart';

abstract class DetailTvShowEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDetailTvShow extends DetailTvShowEvent {
  final int id;
  FetchDetailTvShow(this.id);

  @override
  List<Object?> get props => [id];
}
