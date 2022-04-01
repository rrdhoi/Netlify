import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'on_the_air_tv_show_event.dart';
part 'on_the_air_tv_show_state.dart';

class OnTheAirTvShowBloc
    extends Bloc<OnTheAirTvShowEvent, OnTheAirTvShowState> {
  final GetTvShowOnTheAir _onTheAirTvShow;

  OnTheAirTvShowBloc(this._onTheAirTvShow) : super(OnTheAirTvShowEmpty()) {
    on<FetchOnTheAirTvShow>((event, emit) async {
      emit(OnTheAirTvShowLoading());
      final result = await _onTheAirTvShow.execute();
      result.fold((failure) {
        emit(OnTheAirTvShowError(failure.message));
      }, (data) {
        emit(OnTheAirTvShowHasData(data));
      });
    });
  }
}
