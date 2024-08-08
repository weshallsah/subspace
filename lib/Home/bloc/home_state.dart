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

class HomeLoadedOfflinestate extends HomeState {
  List<Blog> blogs;
  HomeLoadedOfflinestate(this.blogs);
}

class HometoDetailState extends HomeActionState {
  Blog blog;
  VoidCallback clicked;
  HometoDetailState(this.blog, this.clicked);
}

class HomeAddFavState extends HomeActionState {
  Blog blog;
  HomeAddFavState(this.blog);
}
