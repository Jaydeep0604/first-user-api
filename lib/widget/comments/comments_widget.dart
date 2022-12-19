import 'package:first_user_api/models/comments_model.dart';
import 'package:flutter/material.dart';

class CommentsWidget extends StatelessWidget {
   CommentsWidget({Key? key,required this.commentsModel}) : super(key: key);
  CommentsModel commentsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          height: 180,
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
                  Colors.brown,
                  Colors.blueAccent,
                ],
              )),
          child: Align(alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Container(
                                  child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text("Name :",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 32,
                                    width: MediaQuery.of(context).size.width * 0.55,
                                    
                                    child: Align(alignment: Alignment.topLeft,
                                      child: Text(
                                          "${commentsModel.name}",
                                          style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    Container(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Email :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                // height: 50,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("${commentsModel.email}",
                                        style: TextStyle(color: Colors.white,))),
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
                
                SizedBox(
                  height: 34,
                ),
                Align(alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.grey,
                            Colors.white54,
                          ],
                        )),
                    //height: 50,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "${commentsModel.body}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
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
    );
  }
}
