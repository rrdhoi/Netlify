import 'package:dartz/dartz.dart';

import '../../../utils/failure.dart';
import '../../entities/tvshow/tvshow.dart';
import '../../repositories/tvshow_repository.dart';

class GetPopularTvShow {
  TvShowRepository repository;

  GetPopularTvShow(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() =>
      repository.getPopularTvShows();
}
