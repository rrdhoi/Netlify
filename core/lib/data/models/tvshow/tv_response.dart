import 'package:core/data/models/tvshow/tv_model.dart';
import 'package:equatable/equatable.dart';

class TvShowResponse extends Equatable {
  TvShowResponse({
    required this.tvShowList,
  });

  final List<TvShowModel> tvShowList;

  factory TvShowResponse.fromJson(Map<String, dynamic> json) => TvShowResponse(
        tvShowList: List<TvShowModel>.from((json["results"] as List)
            .map((x) => TvShowModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvShowList.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [tvShowList];
}
