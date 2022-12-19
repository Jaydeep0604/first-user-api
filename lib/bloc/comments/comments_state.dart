part of 'comments_bloc.dart';

abstract class CommentsState {}

class CommentsInitial extends CommentsState {
  List<Object?> get props => [];
}

class CommentsNoInternate extends CommentsState {
  List<Object?> get props => [];
}

class CommentsLoadingState extends CommentsState {
  List<Object?> get props => [];
}

class CommentsLoadedStete extends CommentsState {
  List<CommentsModel> Commentslist;
  //bool hasReachedMax;

  CommentsLoadedStete(
      {
      //this.hasReachedMax = true,
      required this.Commentslist});
  @override
  List<Object?> get props => [
        this.Commentslist,
      ];
}

class NoCommentsState extends CommentsState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "NO User Data Available";
  }
}

class CommentsErrorState extends CommentsState {
  final String msg;
 CommentsErrorState({required this.msg});
  @override
  List<Object?> get props => [this.msg];
  @override
  String toString() {
    return msg;
  }
}
