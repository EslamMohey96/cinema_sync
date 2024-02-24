import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Image(
          image:AssetImage("assets/icon/cinema.png"),
          width: 300,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
