import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Image(
          image: NetworkImage(
            'https://omega.gg/vox/repository/hub/tmdb/tmdb.png',
          ),
          width: 200,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
