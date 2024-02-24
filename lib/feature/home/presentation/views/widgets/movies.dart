import 'package:cinema_sync/constants.dart';
import 'package:cinema_sync/core/shared_components/size_box.dart';
import 'package:cinema_sync/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cinema_sync/feature/movie_details/presentation/views/movie_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return state is HomeDataLoadingState
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 10,
                      left: 10,
                    ),
                    child: GridView.count(
                      mainAxisSpacing: 0.1,
                      crossAxisSpacing: 0.1,
                      childAspectRatio:
                       MediaQuery.of(context).size.width >
                                  MediaQuery.of(context).size.height?
                          (3.5 / ((constraints.maxWidth / 240).floor())) /
                              ((MediaQuery.of(context).size.width) /
                                  (MediaQuery.of(context).size.height))
                         : (1.7 / ((constraints.maxWidth / 240).floor())) /
                              ((MediaQuery.of(context).size.height) /
                                  (MediaQuery.of(context).size.width)),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: (constraints.maxWidth / 240).floor(),
                      children: List.generate(
                        cubit.listMoviesDetailsModel.length,
                        (index) => Column(
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                InkWell(
                                  onTap: () {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsView(
                                                  res: cubit.listMoviesDetailsModel[index])),
                                    );
                                  },
                                  child: Image(
                                    image: NetworkImage(
                                      cubit.listMoviesDetailsModel[index]!.posterPath!=null?
                                      '$imageBaseURL${cubit.listMoviesDetailsModel[index]!.posterPath}'
                                      :'https://img.freepik.com/free-photo/film-stripes-with-film-reel-dark-backdrop_23-2148188225.jpg?size=626&ext=jpg&ga=GA1.1.848473062.1704283184&semt=ais',
                                    ),
                                    width: 200,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (cubit.listMoviesDetailsModel[index]!.adult ??
                                    false)
                                   const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child:Text('+18'),
                                    ),
                                  )
                              ],
                            ),
                            sizeBoxH(10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(),
                                sizeBoxW(20),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${cubit.listMoviesDetailsModel[index]!.title}',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                sizeBoxW(20),
                                const Icon(
                                  IconBroken.Star,
                                  color: Colors.red,
                                ),
                                Text(
                                  '${cubit.listMoviesDetailsModel[index]!.voteAverage}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
