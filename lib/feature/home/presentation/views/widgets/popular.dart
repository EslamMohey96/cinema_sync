import 'package:cinema_sync/constants.dart';
import 'package:cinema_sync/core/shared_components/size_box.dart';
import 'package:cinema_sync/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cinema_sync/feature/movie_details/presentation/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return state is HomeDataLoadingState
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 10,
                  left: 10,
                ),
                height: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.movieDetails =
                                  cubit.popularMoviesModel.results![index];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailsView(
                                        res: cubit.popularMoviesModel
                                            .results![index])),
                              );
                            },
                            child: Image(
                              image: NetworkImage(
                                '$imageBaseURL${cubit.popularMoviesModel.results![index].posterPath}',
                              ),
                              width: 170,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (cubit.popularMoviesModel.results![index].adult ??
                              false)
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Text('+18'),
                            )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            IconBroken.Star,
                            color: Colors.red,
                          ),
                          Text(
                            '${cubit.popularMoviesModel.results![index].voteAverage}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${cubit.popularMoviesModel.results![index].title}',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => sizeBoxW(5),
                  itemCount: cubit.popularMoviesModel.results!.length,
                ),
              );
      },
    );
  }
}
