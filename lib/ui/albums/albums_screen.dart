import 'package:first_user_api/bloc/albums/albums_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/widget/albums/albums_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  late AlbumsBloc albumsBloc;

  @override
  void initState() {
    albumsBloc = context.read<AlbumsBloc>();
    albumsBloc.add(albumsEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Albums",
          style: TextStyle(color: Palette.textColor),
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (context, state) { 
              if (state is AlbumsInitial || state is AlbumsLoadingState) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                );
              }
              // print('work1');
              if (state is AlbumsLoadedStete) {
                //print("work2");
                return Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemCount: state.Albumslist.length,
                    itemBuilder: (context, index) {
                      return AlbumsWidget(albumsModel: state.Albumslist[index]);
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