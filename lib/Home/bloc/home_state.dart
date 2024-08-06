part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeActionState extends HomeState {}

class HomeLoadingstate extends HomeState {}

class HomeErrorstate extends HomeState {}

class HomeLoadedstate extends HomeState {
  List<Blog> blogs;
  HomeLoadedstate(this.blogs);
}

class HometoDetailState extends HomeActionState {
  Blog blog;
  HometoDetailState(this.blog);
}

class HomeAddFavState extends HomeActionState {}
