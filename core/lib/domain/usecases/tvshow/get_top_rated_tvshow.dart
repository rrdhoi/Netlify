import 'package:dartz/dartz.dart';
import '../../../utils/failure.dart';
import '../../entities/tvshow/tvshow.dart';
import '../../repositories/tvshow_repository.dart';

class GetTopRatedTvShow {
  TvShowRepository repository;

  GetTopRatedTvShow(this.repository);

  Future<Either<Failure, List<TvShow>>> execute() =>
      repository.getTopRatedTvShows();
}
