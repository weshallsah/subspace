part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavEvent extends HomeEvent {
  Blog blog;
  HomeNavEvent(this.blog);
}

class AddFavEvent extends HomeEvent {}
