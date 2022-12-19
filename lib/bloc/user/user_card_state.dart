part of 'user_card_bloc.dart';

@immutable
abstract class UserCardState {}

class UserCardInitial extends UserCardState {
  List<Object?> get props => [];
}

class UserNoInternate extends UserCardState {
  List<Object?> get props => [];
}

class UserLoadingState extends UserCardState {
  List<Object?> get props => [];
}

class UserLoadedStete extends UserCardState {
  List<UserModel> userlist;
  //bool hasReachedMax;

  UserLoadedStete(
      {
      //this.hasReachedMax = true,
      required this.userlist});
  @override
  List<Object?> get props => [
        this.userlist,
      ];
}

class NoUserState extends UserCardState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "NO User Data Available";
  }
}

class UserErrorState extends UserCardState {
  final String msg;
  UserErrorState({required this.msg});
  @override
  List<Object?> get props => [this.msg];
  @override
  String toString() {
    return msg;
  }
}
