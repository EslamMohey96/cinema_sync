import 'package:cinema_sync/constants.dart';
import 'package:cinema_sync/core/shared_components/size_box.dart';
import 'package:flutter/material.dart';

class MovieDetailsView extends StatelessWidget {
  late dynamic res;
  MovieDetailsView({super.key, required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100B20),
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  res.posterPath != null
                      ? '$imageBaseURL${res.posterPath}'
                      : 'https://img.freepik.com/free-photo/film-stripes-with-film-reel-dark-backdrop_23-2148188225.jpg?size=626&ext=jpg&ga=GA1.1.848473062.1704283184&semt=ais',
                ),
                fit: BoxFit.fitWidth,
                opacity: 0.2),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image(
                    image: NetworkImage(
                      res.posterPath != null
                          ? '$imageBaseURL${res.posterPath}'
                          : 'https://img.freepik.com/free-photo/film-stripes-with-film-reel-dark-backdrop_23-2148188225.jpg?size=626&ext=jpg&ga=GA1.1.848473062.1704283184&semt=ais',
                    ),
                    width: 200,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  if (res.adult ?? false)
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text('+18'),
                      ),
                    )
                ],
              ),
              sizeBoxH(10),
              Text(
                '${res.title}',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${res.overview}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
