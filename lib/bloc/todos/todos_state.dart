part of 'todos_bloc.dart';

abstract class TodosState {}

class TodosInitial extends TodosState {
  List<Object?> get props => [];
}

class TodosNoInternate extends TodosState {
  List<Object?> get props => [];
}

class TodosLoadingState extends TodosState {
  List<Object?> get props => [];
}

class TodosLoadedStete extends TodosState {
  List<TodosModel> todoslist;
  //bool hasReachedMax;

  TodosLoadedStete(
      {
      //this.hasReachedMax = true,
      required this.todoslist});
  @override
  List<Object?> get props => [
        this.todoslist,
      ];
}

class NoTodosState extends TodosState {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return "NO User Data Available";
  }
}

class TodosErrorState extends TodosState {
  final String msg;
  TodosErrorState({required this.msg});
  @override
  List<Object?> get props => [this.msg];
  @override
  String toString() {
    return msg;
  }
}
