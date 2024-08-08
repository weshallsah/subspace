part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavEvent extends HomeEvent {
  Blog blog;
  VoidCallback getback;
  HomeNavEvent(this.blog,this.getback);
}

class AddFavEvent extends HomeEvent {
  Blog blog;
  AddFavEvent(this.blog);
}
