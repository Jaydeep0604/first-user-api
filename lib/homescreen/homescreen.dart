import 'package:first_user_api/bloc/albums/albums_bloc.dart';
import 'package:first_user_api/bloc/comments/comments_bloc.dart';
import 'package:first_user_api/bloc/photos/photos_bloc.dart';
import 'package:first_user_api/bloc/posts/posts_bloc.dart';
import 'package:first_user_api/bloc/todos/todos_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/repo/albums_repo.dart';
import 'package:first_user_api/repo/comments_repo.dart';
import 'package:first_user_api/repo/photos_repo.dart';
import 'package:first_user_api/repo/posts_repo.dart';
import 'package:first_user_api/repo/todos_repo.dart';
import 'package:first_user_api/repo/user_repo.dart';
import 'package:first_user_api/ui/albums/albums_screen.dart';
import 'package:first_user_api/ui/comments/comments_screen.dart';
import 'package:first_user_api/ui/photos/photos_screen.dart';
import 'package:first_user_api/ui/posts/posts_screen.dart';
import 'package:first_user_api/ui/todos/todos_screen.dart';
import 'package:first_user_api/ui/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_card_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                    children: [
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => UserCardBloc(repo: UserImpl()),
                              child: UserScreen(),
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Users",
                          style: TextStyle(color: Palette.textColor, fontSize: 20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                 onTap: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => TodosBloc(repo: TodosImpl()),
                              child: TodosScreen(),
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Todos",
                          style: TextStyle(color: Palette.textColor, fontSize: 20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
               onTap: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => PhotosBloc(repo: PhotosImpl()),
                              child: PhotosScreen(),
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Photos",
                          style: TextStyle(color: Palette.textColor, fontSize: 20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => AlbumsBloc(repo: AlbumsImpl()),
                              child: AlbumsScreen(),
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Albums",
                          style: TextStyle(color: Palette.textColor, fontSize: 20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  print("users");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => CommentsBloc(repo: CommentsImpl()),
                              child: CommentsScreen(),
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Comments",
                          style: TextStyle(color: Palette.textColor, fontSize: 20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () {
                  print("users");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => PostsBloc(repo: PostsImpl()),
                              child: PostsScreen(),
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Posts",
                          style: TextStyle(color: Palette.textColor, fontSize: 20),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
                    ],
                  ),
            ),
          )),
    );
  }
}
