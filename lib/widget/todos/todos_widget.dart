import 'package:first_user_api/models/todos_model.dart';
import 'package:first_user_api/palette.dart';
import 'package:flutter/material.dart';

class TodosWidget extends StatelessWidget {
  TodosWidget({Key? key, required this.todosModel}) : super(key: key);
  TodosModel todosModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Palette.defalutColor,
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.2),
          //   spreadRadius: 5,
          //   blurRadius: 7,
          //   offset: Offset(0, 2), // changes position of shadow
          // ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 25,right: 25),
                child: Align(
                    alignment: Alignment.center,
                    child: Text("${todosModel.title.toString()}",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
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
                        child: Text("id                  :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("${todosModel.id.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white))),
                  ),
                ],
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
                        child: Text("Complated  :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70))),
                  ),
                  if(todosModel.completed==false)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("${todosModel.completed}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange))),
                  ),
                 if(todosModel.completed==true)
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("${todosModel.completed}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent))),
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
