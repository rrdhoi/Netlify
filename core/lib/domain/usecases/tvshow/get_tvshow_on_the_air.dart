import 'package:dartz/dartz.dart';

import '../../../utils/failure.dart';
import '../../entities/tvshow/tvshow.dart';
import '../../repositories/tvshow_repository.dart';


class GetTvShowOnTheAir {
  final TvShowRepository repository;

  GetTvShowOnTheAir(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() =>
      repository.getOnTheAirTvShow();
}
