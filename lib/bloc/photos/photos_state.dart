part of 'photos_bloc.dart';

abstract class PhotosState {}

class PhotosInitial extends PhotosState {
  List<Object?> get props => [];
}

class PhotosNoInternate extends PhotosState {
  List<Object?> get props => [];
}

class PhotosLoadingState extends PhotosState {
  List<Object?> get props => [];
}

class PhotosLoadedStete extends PhotosState {
  List<PhotosModel> Photoslist;
  //bool hasReachedMax;

  PhotosLoadedStete(
      {
      //this.hasReachedMax = true,
      required this.Photoslist});
  @override
  List<Object?> get props => [
        this.Photoslist,
      ];
}

class NoPhotosState extends PhotosState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "NO User Data Available";
  }
}

class PhotosErrorState extends PhotosState {
  final String msg;
 PhotosErrorState({required this.msg});
  @override
  List<Object?> get props => [this.msg];
  @override
  String toString() {
    return msg;
  }
}
