import 'package:cinema_sync/constants.dart';
import 'package:cinema_sync/core/utils/dioHelper.dart';
import 'package:cinema_sync/feature/home/data/models/popular_movies_model.dart';
import 'package:cinema_sync/feature/home/data/repo/popular_movies_repo/popular_movies_repo.dart';
import 'package:dartz/dartz.dart';

class PopularMoviesRepoImplement extends PopularMoviesRepo {
  @override
  Future<Either<PopularMoviesModel, dynamic>> getMovies({int page = 1}) async {
    late PopularMoviesModel popularMoviesModel;

    try {
      return Left(await dioHelper.getData(
        url: popular,
        opt: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        queryParameter: {
          'page': page,
        },
      ).then((value) {
        popularMoviesModel = PopularMoviesModel.fromJson(value.data);
        print('----------------popular header and responses----------------------------');
        print(
            'url: $popular,\n opt:{\n accept:application/json,\n Authorization:Bearer $accessToken,\n },\n queryParameter:{\n page: $page,\n   },');
        print(value.data);
        return popularMoviesModel;
      }));
    } on Exception catch (onError) {
      return Right(onError);
    }
  }
}
