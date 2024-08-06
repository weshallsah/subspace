import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<DetailInitEvent>((event, emit) {
      try {
        emit(DetailLoadingState());
        emit(DetailLoadedState());
      } catch (e) {
        print(e);
        emit(DetailErrorState());
      }
    });
    on<AddFav>((event, emit) {
      emit(FavButtonClikedState());
    });
    on<Tiwtter>((event, emit) {
      emit(TiwterButtonClikedState());
    });
    on<Instagram>((event, emit) {
      emit(InstagramButtonClikedState());
    });
    on<Facebook>((event, emit) {
      emit(FacebookButtonClikedState());
    });
  }
}
