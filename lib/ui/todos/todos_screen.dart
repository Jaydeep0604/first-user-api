import 'package:first_user_api/bloc/todos/todos_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/widget/todos/todos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/todos/todos_event.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  late TodosBloc todosBloc;

  @override
  void initState() {
    todosBloc = context.read<TodosBloc>();
    todosBloc.add(TodosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todos",
          style: TextStyle(color: Palette.textColor),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.center,
            child: BlocBuilder<TodosBloc, TodosState>(
              builder: (context, state) {
                if (state is TodosInitial || state is TodosLoadingState) {
                  return CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    color: Colors.white,
                  );
                }
                if (state is TodosLoadedStete) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Expanded(
                        child: ListView.separated(
                      itemCount: state.todoslist.length,
                      itemBuilder: (context, index) {
                        return TodosWidget(todosModel: state.todoslist[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                    )),
                  );
                }
                if (state is TodosErrorState || state is NoTodosState) {
                  return Text(state.toString());
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}