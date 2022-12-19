import 'package:first_user_api/models/posts_model.dart';
import 'package:flutter/material.dart';

class PostsWidget extends StatelessWidget {
   PostsWidget({Key? key,required this.postmodel}) : super(key: key);
  PostsModel postmodel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          height: 140,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              //color: Palette.textColor,
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
                  Color.fromARGB(255, 105, 58, 193),
                  Color.fromARGB(255, 58, 55, 64),
                ],
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Title :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,fontSize: 12))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              // height: 50,
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text("${postmodel.title}",
                                  style: TextStyle(color: Colors.white,fontSize: 12)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      //height: 50,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "${postmodel.body}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey,fontSize: 13,
                                      overflow: TextOverflow.ellipsis)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
