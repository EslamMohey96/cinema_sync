part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeDataLoadingState extends HomeState {}
final class GetHomeDataDoneState extends HomeState {}
final class GetHomeDataErrorState extends HomeState {}

final class MoviesDataLoadingState extends HomeState {}
final class MoviesDataDoneState extends HomeState {}
final class MoviesDataErrorState extends HomeState {}






