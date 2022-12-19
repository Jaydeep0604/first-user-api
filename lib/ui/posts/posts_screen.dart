import 'package:first_user_api/bloc/posts/posts_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/widget/posts/posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({ Key? key }) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
   late PostsBloc postsBloc;

  @override
  void initState() {
    postsBloc = context.read<PostsBloc>();
    postsBloc.add(postsEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts",style: TextStyle(color: Palette.textColor),),),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsInitial || state is PostsLoadingState) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                );
              }
             // print('work1');
               if (state is PostsLoadedStete) {
                //print("work2");
                return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListView.separated(
                  itemCount: state.postslist.length,
                  itemBuilder: (context, index) {
                      return PostsWidget(postmodel: state.postslist[index]);
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
