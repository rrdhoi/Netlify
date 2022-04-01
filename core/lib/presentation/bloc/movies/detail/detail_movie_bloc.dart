import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _recommendations;

  DetailMovieBloc(this._getMovieDetail, this._recommendations)
      : super(DetailMovieEmpty()) {
    on<FetchDetailMovie>((event, emit) async {
      emit(DetailMovieLoading());

      final detailResult = await _getMovieDetail.execute(event.id);
      final recommendationsResult = await _recommendations.execute(event.id);

      detailResult.fold((failure) {
        emit(DetailMovieError(failure.message));
      }, (data) {
        recommendationsResult.fold(
            (failure) => emit(DetailMovieError(failure.message)),
            (recommendations) =>
                emit(DetailMovieHasData(data, recommendations)));
      });
    });
  }
}
