import 'package:cinema_sync/core/shared_components/size_box.dart';
import 'package:cinema_sync/feature/home/presentation/views/widgets/popular.dart';
import 'package:cinema_sync/feature/home/presentation/views/widgets/movies.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const DrawerBody(),
      appBar: AppBar(
        backgroundColor: const Color(0xff100B20),
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:MainAxisSize.min,
          children: [
            Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                  left: 10,
                ),
                width: double.infinity,
                child: const Text(
                  'Best Seller',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.red,
                  ),
                )),
            const Popular(),
            Container(
                padding: const EdgeInsets.only(
                  top: 40,
                  right: 10,
                  left: 10,
                ),
                width: double.infinity,
                child: const Text(
                  'Movies',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.red,
                  ),
                )),
            sizeBoxH(2),
            const Movies(),
          ],
        ),
      ),
    );
  }
}
