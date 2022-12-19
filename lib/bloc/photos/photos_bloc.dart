import 'package:equatable/equatable.dart';
import 'package:first_user_api/models/photos_model.dart';
import 'package:first_user_api/repo/photos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosRepo repo;

  PhotosBloc({required this.repo}) : super(PhotosInitial()) {
    on<PhotosEvent>(_onUserCardEvent);
  }
  _onUserCardEvent(PhotosEvent event, Emitter<PhotosState> emit) async {
    try {
      emit(PhotosLoadingState());
      List<PhotosModel> PData = (await repo.getPhotosData());

      if (PData.isEmpty) {
        emit(NoPhotosState());
      } else {
        emit(PhotosLoadedStete(Photoslist: PData));
      }
    } catch (e) {
      emit(PhotosErrorState(msg: e.toString()));
    }
  }
}
