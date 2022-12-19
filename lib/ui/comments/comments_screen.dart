import 'package:first_user_api/bloc/comments/comments_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/widget/comments/comments_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late CommentsBloc commentsBloc;
  @override
  void initState() {
    commentsBloc = context.read<CommentsBloc>();
    commentsBloc.add(commentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comments",
          style: TextStyle(color: Palette.textColor),
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<CommentsBloc, CommentsState>(
            builder: (context, state) {
              if (state is CommentsInitial || state is CommentsLoadingState) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                );
              }
              // print('work1');
              if (state is CommentsLoadedStete) {
                //print("work2");
                return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.separated(
                  itemCount: state.Commentslist.length,
                  itemBuilder: (context, index) {
                      return CommentsWidget(
                          commentsModel: state.Commentslist[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25,
                      );
                  },
                ),
                    ));
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
