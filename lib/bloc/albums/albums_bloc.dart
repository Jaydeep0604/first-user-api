
import 'package:equatable/equatable.dart';
import 'package:first_user_api/models/albums_model.dart';
import 'package:first_user_api/repo/albums_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<albumsEvent, AlbumsState> {
  AlbumsRepo repo;

  AlbumsBloc({required this.repo}) : super(AlbumsInitial()) {
    on<albumsEvent>(_onAlbumsEvent);
  }
  _onAlbumsEvent(albumsEvent event, Emitter<AlbumsState> emit) async {
    try {
      emit(AlbumsLoadingState());
      List<AlbumsModel> PData = (await repo.getAlbumsData());

      if (PData.isEmpty) {
        emit(NoAlbumsState());
      } else {
        emit(AlbumsLoadedStete(Albumslist: PData));
      }
    } catch (e) {
      emit(AlbumsErrorState(msg: e.toString()));
    }
  }
}