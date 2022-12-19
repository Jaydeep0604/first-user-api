import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_user_api/bloc/photos/photos_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/widget/photos/photos_widget.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({ Key? key }) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
    late PhotosBloc photosBloc;

  @override
  void initState() {
    photosBloc = context.read<PhotosBloc>();
    photosBloc.add(photosEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photos",style: TextStyle(color: Palette.textColor),),),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              if (state is PhotosInitial || state is PhotosLoadingState) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                );
              }
             // print('work1');
               if (state is PhotosLoadedStete) {
                //print("work2");
                return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.separated(
                  itemCount: state.Photoslist.length,
                  itemBuilder: (context, index) {
                      return PhotosWidget(photosModel:state.Photoslist[index]);
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
