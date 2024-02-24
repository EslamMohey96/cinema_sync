import 'package:cinema_sync/constants.dart';
import 'package:cinema_sync/core/utils/dioHelper.dart';
import 'package:cinema_sync/feature/home/data/models/movie_details_model.dart';
import 'package:cinema_sync/feature/home/data/models/movies_model.dart';
import 'package:cinema_sync/feature/home/data/repo/movies_repo/movies_repo.dart';
import 'package:dartz/dartz.dart';

class MoviesRepoImplement extends MoviesRepo {
  @override
  Future<Either<MoviesModel, dynamic>> getMovies(
      {int page = 1}) async {
    late MoviesModel moviesModel;

    try {
      return Left(await dioHelper.getData(
        url: movies,
        opt: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        queryParameter: {
          'page': page,
        },
      ).then((value) {
        moviesModel = MoviesModel.fromJson(value.data);
        List<MovieDetailsModel> movieList = [];
        print('----------------movies header and responses----------------------------');
        print('url: $movies,\n opt:{\n accept:application/json,\n Authorization:Bearer $accessToken,\n },\n queryParameter:{\n page: $page,\n   },');
        print(value.data);
        return moviesModel;
      }));
    } on Exception catch (onError) {
      return Right(onError);
    }
  }
}
