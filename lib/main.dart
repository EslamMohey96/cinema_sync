import 'package:cinema_sync/core/utils/dioHelper.dart';
import 'package:cinema_sync/feature/home/data/models/movie_details_model.dart';
import 'package:cinema_sync/feature/home/data/repo/movie_details_repo/movie_details_repo%20_implement.dart';
import 'package:cinema_sync/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:cinema_sync/feature/home/presentation/views/home_view.dart';
import 'package:cinema_sync/feature/splash_view/presentation/views/splash_view.dart';
import 'package:cinema_sync/feature/movie_details/presentation/views/movie_details_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_sync/core/utils/bloc_observer.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background messaging');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await FirebaseMessaging.instance.getToken();
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((event) {
    print('onMessage');
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('onMessageOpenedApp');
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = HandelBlocObserver();
  dioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeCubit()..getHomeData(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData()
                  .copyWith(scaffoldBackgroundColor: const Color(0xff100B20)),
              // darkTheme: darkMode,
              themeMode: ThemeMode.dark,
              routerConfig: GoRouter(
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (BuildContext context, GoRouterState stateR) {
                      return state is HomeDataLoadingState
                          ? const SplashView()
                          : const HomeView();
                    },
                  ),
                  GoRoute(
                      path: '/home',
                      builder: (BuildContext context, GoRouterState state) {
                        return const HomeView();
                      }),
                  GoRoute(
                    path: '/movieDetails',
                    builder: (BuildContext context, GoRouterState state) {
                      late MovieDetailsModel movieDetails;
                      MovieDetailsRepoImplement()
                          // state.path!.toString().split('/').last as int
                          .getMovies(id: 212)
                          .then((value) {
                        value.fold(
                          (movieDetailsModel) {
                            movieDetails = movieDetailsModel!;
                          },
                          (error) {},
                        );
                      });
                      return MovieDetailsView(
                        res: movieDetails,
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
// SHA-256: 17:89:A1:E2:22:A9:C5:CE:E4:0F:48:C3:4E:2F:58:1F:3C:CF:C4:94:5A:F3:98:DE:0A:53:1B:EB:3A:9A:5C:A1
// SHA1: 9C:45:23:F2:B9:87:DF:1B:BE:86:93:3A:C8:D7:B1:B8:0A:2B:8F:AA