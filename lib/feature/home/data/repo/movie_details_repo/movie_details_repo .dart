import 'package:cinema_sync/feature/home/data/models/movie_details_model.dart';
import 'package:cinema_sync/feature/home/data/models/movies_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class MovieDetailsRepo {
  Future<Either<MovieDetailsModel? , dynamic >> getMovies({
    required int id,
  });
}
