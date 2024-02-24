import 'package:cinema_sync/constants.dart';
import 'package:cinema_sync/core/utils/dioHelper.dart';
import 'package:cinema_sync/feature/home/data/models/movie_details_model.dart';
import 'package:cinema_sync/feature/home/data/repo/movie_details_repo/movie_details_repo%20.dart';
import 'package:dartz/dartz.dart';

class MovieDetailsRepoImplement extends MovieDetailsRepo {
  @override
  Future<Either<MovieDetailsModel?, dynamic>> getMovies(
      {required int id}) async {
    try {
      return Left(await dioHelper.getData(
        url: '$id',
        opt: {
          'accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      ).then((value) {
        return MovieDetailsModel.fromJson(value.data);
      }));
    } on Exception catch (onError) {
      return Right(onError);
    }
  }
}
