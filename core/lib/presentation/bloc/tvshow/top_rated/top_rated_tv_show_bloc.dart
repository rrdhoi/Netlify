import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tv_show_event.dart';
part 'top_rated_tv_show_state.dart';

class TopRatedTvShowBloc
    extends Bloc<TopRatedTvShowEvent, TopRatedTvShowState> {
  final GetTopRatedTvShow _topRatedTvShow;

  TopRatedTvShowBloc(this._topRatedTvShow) : super(TopRatedEmpty()) {
    on<FetchTopRatedTvShow>((event, emit) async {
      emit(TopRatedLoading());
      final result = await _topRatedTvShow.execute();
      result.fold((failure) {
        emit(TopRatedError(failure.message));
      }, (data) {
        emit(TopRatedHasData(data));
      });
    });
  }
}
