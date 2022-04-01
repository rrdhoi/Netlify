import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'detail_tv_show_event.dart';
part 'detail_tv_show_state.dart';

class DetailTvShowBloc extends Bloc<DetailTvShowEvent, DetailTvShowState> {
  final GetTvShowDetail _tvShowDetail;
  final GetTvShowRecommendations _recommendations;

  DetailTvShowBloc(
    this._tvShowDetail,
    this._recommendations,
  ) : super(DetailTvShowEmpty()) {
    on<FetchDetailTvShow>((event, emit) async {
      emit(DetailTvShowLoading());

      final detailResult = await _tvShowDetail.execute(event.id);
      final recommendationsResult = await _recommendations.execute(event.id);

      detailResult.fold((failure) {
        emit(DetailTvShowError(failure.message));
      }, (data) {
        recommendationsResult.fold(
            (failure) => emit(DetailTvShowError(failure.message)),
            (recommendations) =>
                emit(DetailTvShowHasData(data, recommendations)));
      });
    });
  }
}
