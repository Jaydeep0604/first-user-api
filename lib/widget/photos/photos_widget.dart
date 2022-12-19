import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_user_api/models/photos_model.dart';
import 'package:flutter/material.dart';

class PhotosWidget extends StatelessWidget {
   PhotosWidget({Key? key,required this.photosModel}) : super(key: key);
  PhotosModel photosModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Palette.textColor,
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
              Colors.black87,
              Colors.grey,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(alignment: Alignment.center,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      height: 70,width: 70,
                      fit: BoxFit.fill,
                          imageUrl: "${photosModel.url}",
                          progressIndicatorBuilder: (context, url, downloadProgress) => 
                                  CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                     ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: 150,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          "${photosModel.title}",
                          style: TextStyle(fontSize: 8, color: Colors.white))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
