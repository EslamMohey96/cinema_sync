import 'package:cinema_sync/feature/home/data/models/movies_model.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepo {
  Future<Either<MoviesModel , dynamic >> getMovies({
    int page=1,
  });
}
