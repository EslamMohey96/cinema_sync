import 'package:cinema_sync/feature/home/data/models/movie_details_model.dart';
import 'package:cinema_sync/feature/home/data/models/movies_model.dart';
import 'package:cinema_sync/feature/home/data/models/popular_movies_model.dart';
import 'package:cinema_sync/feature/home/data/repo/movie_details_repo/movie_details_repo%20_implement.dart';
import 'package:cinema_sync/feature/home/data/repo/movies_repo/movies_repo_implement.dart';
import 'package:cinema_sync/feature/home/data/repo/popular_movies_repo/popular_movies_repo_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  late MoviesModel moviesModel;
  List<MovieDetailsModel?> listMoviesDetailsModel = [];
  late PopularMoviesModel popularMoviesModel;
  late dynamic movieDetails;
  int moviesModelDone = 0;

  void getHomeData() {
    emit(HomeDataLoadingState());
    Future.wait([
      MoviesRepoImplement().getMovies(page: 1).then((value) {
        value.fold(
          (moviesModel) {
            this.moviesModel = moviesModel;
          },
          (error) {
            emit(GetHomeDataErrorState());
          },
        );
      }).then((value) async{
        for (var element in moviesModel.results!) {
          await MovieDetailsRepoImplement().getMovies(id: element.id!).then((value) {
          value.fold(
            (movieDetailsModel) {
              listMoviesDetailsModel.add(movieDetailsModel);
            },
            (error) {
              emit(GetHomeDataErrorState());
            },
          );
        });
                }        
        emit(GetHomeDataDoneState());
        // moviesModelDone = 1;
      }),
      PopularMoviesRepoImplement().getMovies(page: 1).then((value) {
        value.fold(
          (popularMoviesModel) {
            this.popularMoviesModel = popularMoviesModel;
          },
          (error) {
            emit(GetHomeDataErrorState());
          },
        );
      }),
    ]);
  }
}
