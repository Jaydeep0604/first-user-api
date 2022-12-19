import 'package:first_user_api/bloc/todos/todos_event.dart';
import 'package:first_user_api/models/todos_model.dart';
import 'package:first_user_api/repo/todos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosRepo repo;

  TodosBloc({required this.repo}) : super(TodosInitial()) {
    on<TodosEvent>(_onTodosEvent);
  }
  _onTodosEvent(TodosEvent event, Emitter<TodosState> emit) async {
    try {
      emit(TodosLoadingState());
      List<TodosModel> tData = (await repo.getTodosData());

      if (tData.isEmpty) {
        emit(NoTodosState());
      } else {
        emit(TodosLoadedStete(todoslist: tData));
      }
    } catch (e) {
      emit(TodosErrorState(msg: e.toString()));
    }
  }
}
