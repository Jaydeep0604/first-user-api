import 'package:equatable/equatable.dart';
import 'package:first_user_api/models/posts_model.dart';
import 'package:first_user_api/repo/posts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepo repo;

  PostsBloc({required this.repo}) : super(PostsInitial()) {
    on<PostsEvent>(_onPostsEvent);
  }
  _onPostsEvent(PostsEvent event, Emitter<PostsState> emit) async {
    try {
      emit(PostsLoadingState());
      List<PostsModel> pData = await repo.getPostsData();

      if (pData.isEmpty) {
        emit(NoPostsState());
      } else {
        emit(PostsLoadedStete(postslist: pData));
      }
    } catch (e) {
      emit(PostsErrorState(msg: e.toString()));
    }
  }
}
