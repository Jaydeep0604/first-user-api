import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_user_api/models/user_model.dart';
import 'package:first_user_api/repo/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_card_event.dart';
part 'user_card_state.dart';

class UserCardBloc extends Bloc<UserCardEvent, UserCardState> {
  UserRepo repo;

  UserCardBloc({required this.repo}) : super(UserCardInitial()) {
    on<UserCardEvent>(_onUserCardEvent);
  }
  _onUserCardEvent(UserCardEvent event, Emitter<UserCardState> emit) async {
    try {
      emit(UserLoadingState());
      List<UserModel> uData = (await repo.getUserData());

      if (uData.isEmpty) {
        emit(NoUserState());
      } else {
        emit(UserLoadedStete(userlist: uData));
      }
    } catch (e) {
      emit(UserErrorState(msg: e.toString()));
    }
  }
}
