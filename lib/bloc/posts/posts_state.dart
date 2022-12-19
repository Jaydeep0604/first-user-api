part of 'posts_bloc.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {
  List<Object?> get props => [];
}

class PostsNoInternate extends PostsState {
  List<Object?> get props => [];
}

class PostsLoadingState extends PostsState {
  List<Object?> get props => [];
}

class PostsLoadedStete extends PostsState {
  List<PostsModel> postslist;
  //bool hasReachedMax;

  PostsLoadedStete(
      {
      //this.hasReachedMax = true,
      required this.postslist});
  @override
  List<Object?> get props => [
        this.postslist,
      ];
}

class NoPostsState extends PostsState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "NO User Data Available";
  }
}

class PostsErrorState extends PostsState {
  final String msg;
 PostsErrorState({required this.msg});
  @override
  List<Object?> get props => [this.msg];
  @override
  String toString() {
    return msg;
  }
}
