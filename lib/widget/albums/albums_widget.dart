import 'package:first_user_api/models/albums_model.dart';
import 'package:first_user_api/palette.dart';
import 'package:flutter/material.dart';

class AlbumsWidget extends StatelessWidget {
   AlbumsWidget({Key? key,required this.albumsModel}) : super(key: key);
  AlbumsModel albumsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.textColor,
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.2),
            //   spreadRadius: 5,
            //   blurRadius: 7,
            //   offset: Offset(0, 2), // changes position of shadow
            // ),
          ],
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blueGrey,
              Colors.teal,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("id      :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("${albumsModel.id}", style: TextStyle(color: Colors.black))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("title  :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black))),
                  ),
                  Container(
                    width: 230,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              "${albumsModel.title}",
                              style: TextStyle(color: Colors.black))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
