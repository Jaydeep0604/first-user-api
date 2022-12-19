
import 'package:equatable/equatable.dart';
import 'package:first_user_api/models/comments_model.dart';
import 'package:first_user_api/repo/comments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsRepo repo;

  CommentsBloc({required this.repo}) : super(CommentsInitial()) {
    on<CommentsEvent>(_onCommentsEvent);
  }
  _onCommentsEvent(CommentsEvent event, Emitter<CommentsState> emit) async {
    try {
      emit(CommentsLoadingState());
      List<CommentsModel> cData = await repo.getCommentsData();

      if (cData.isEmpty) {
        emit(NoCommentsState());
      } else {
        emit(CommentsLoadedStete(Commentslist: cData));
      }
    } catch (e) {
      emit(CommentsErrorState(msg: e.toString()));
    }
  }
}
