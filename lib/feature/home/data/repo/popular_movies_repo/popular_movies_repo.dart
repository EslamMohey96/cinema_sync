import 'package:cinema_sync/feature/home/data/models/popular_movies_model.dart';
import 'package:dartz/dartz.dart';

abstract class PopularMoviesRepo {
  Future<Either<PopularMoviesModel , dynamic >> getMovies({
    int page=1,
  });
}
