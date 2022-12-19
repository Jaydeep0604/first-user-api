part of 'albums_bloc.dart';

abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {
  List<Object?> get props => [];
}

class AlbumsNoInternate extends AlbumsState {
  List<Object?> get props => [];
}

class AlbumsLoadingState extends AlbumsState {
  List<Object?> get props => [];
}

class AlbumsLoadedStete extends AlbumsState {
  List<AlbumsModel> Albumslist;
  //bool hasReachedMax;

  AlbumsLoadedStete(
      {
      //this.hasReachedMax = true,
      required this.Albumslist});
  @override
  List<Object?> get props => [
        this.Albumslist,
      ];
}

class NoAlbumsState extends AlbumsState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "NO User Data Available";
  }
}

class AlbumsErrorState extends AlbumsState {
  final String msg;
 AlbumsErrorState({required this.msg});
  @override
  List<Object?> get props => [this.msg];
  @override
  String toString() {
    return msg;
  }
}
