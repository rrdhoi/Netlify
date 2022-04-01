part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class OnQueryChanged extends SearchEvent {
  String _query = '';

  OnQueryChanged(this._query);

  @override
  List<Object?> get props => [_query];
}
