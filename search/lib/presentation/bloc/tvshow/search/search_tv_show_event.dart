part of 'search_tv_show_bloc.dart';

abstract class SearchTvShowEvent extends Equatable {}

class OnQueryTvShowChanged extends SearchTvShowEvent {
  String _query = '';

  OnQueryTvShowChanged(this._query);

  @override
  List<Object?> get props => [_query];
}
