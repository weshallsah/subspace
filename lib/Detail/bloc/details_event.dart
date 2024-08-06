part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}

class DetailInitEvent extends DetailsEvent {}

class AddFav extends DetailsEvent {}

class Tiwtter extends DetailsEvent {}

class Instagram extends DetailsEvent {}

class Facebook extends DetailsEvent {}
