import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_show_event.dart';
part 'popular_tv_show_state.dart';

class PopularTvShowBloc extends Bloc<PopularTvShowEvent, PopularTvShowState> {
  final GetPopularTvShow _popularTvShow;

  PopularTvShowBloc(this._popularTvShow) : super(PopularEmpty()) {
    on<FetchPopularTvShow>((event, emit) async {
      emit(PopularLoading());
      final result = await _popularTvShow.execute();
      result.fold((failure) {
        emit(PopularError(failure.message));
      }, (data) {
        emit(PopularHasData(data));
      });
    });
  }
}
