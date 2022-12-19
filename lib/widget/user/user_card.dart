import 'package:first_user_api/models/user_model.dart';
import 'package:first_user_api/palette.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCard extends StatefulWidget {
  UserModel userModel;
  UserCard({Key? key, required this.userModel}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  //final Uri _url = Uri.parse('https://flutter.dev');

  void launchURL(String _url) async {
    if (await canLaunch(_url)) {
      await launch(_url,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      width: 304,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        //],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/back.jpg",
                          height: 240,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 127.5, left: 192.5),
                    child: Image.asset(
                      "assets/user.png",
                      scale: 6,
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18, left: 10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${widget.userModel.company!.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Palette.backgroundColor,
                                    fontSize: 12),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: EdgeInsets.only(left: 0, top: 0),
                            child: IconButton(
                              onPressed: () {
                                launchURL(
                                    "https://${widget.userModel.website}");
                              },
                              icon: Image.asset(
                                'assets/website.png',
                                height: 20,
                                width: 20,
                              ),
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("${widget.userModel.username}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Palette.backgroundColor))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Name      :",
                                    style: TextStyle(
                                        color: Palette.backgroundColor,
                                        fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("${widget.userModel.name}",
                                    style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Email      :",
                                    style: TextStyle(
                                        color: Palette.backgroundColor,
                                        fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("${widget.userModel.email}",
                                    style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Phone     :",
                                    style: TextStyle(
                                        color: Palette.backgroundColor,
                                        fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("${widget.userModel.phone}",
                                    style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 10)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Address :",
                                    style: TextStyle(
                                        color: Palette.backgroundColor,
                                        fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    width: 110,
                                    child: Text(
                                        "${widget.userModel.address.suite},${widget.userModel.address.street},\n${widget.userModel.address.city},${widget.userModel.address.suite},\n${widget.userModel.address.zipcode},",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            color: Palette.textColor,
                                            fontSize: 10))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
