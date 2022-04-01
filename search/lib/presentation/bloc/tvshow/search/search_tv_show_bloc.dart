import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search/domain/usescases/tvshow/search_tvshow.dart';

part 'search_tv_show_event.dart';
part 'search_tv_show_state.dart';

class SearchTvShowBloc extends Bloc<SearchTvShowEvent, SearchTvShowState> {
  final SearchTvShow _searchTvShow;

  SearchTvShowBloc(this._searchTvShow) : super(SearchTvShowEmpty()) {
    on<OnQueryTvShowChanged>((event, emit) async {
      final query = event._query;
      emit(SearchTvShowLoading());
      final result = await _searchTvShow.execute(query);
      result.fold((failure) {
        emit(SearchTvShowError(failure.message));
      }, (tvShow) {
        emit(SearchTvShowHasData(tvShow));
      });
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
