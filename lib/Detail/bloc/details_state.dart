part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

class DetailActionState extends DetailsState {}

class DetailLoadedState extends DetailsState {}

class DetailLoadingState extends DetailsState {}

class DetailErrorState extends DetailsState {}

class FavButtonClikedState extends DetailActionState {}

class TiwterButtonClikedState extends DetailActionState {}

class InstagramButtonClikedState extends DetailActionState {}

class FacebookButtonClikedState extends DetailActionState {}