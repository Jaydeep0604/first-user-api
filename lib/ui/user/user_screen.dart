import 'package:first_user_api/bloc/user/user_card_bloc.dart';
import 'package:first_user_api/palette.dart';
import 'package:first_user_api/widget/user/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late UserCardBloc userCardBloc;

  @override
  void initState() {
    userCardBloc = context.read<UserCardBloc>();
    userCardBloc.add(userCardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(color: Palette.textColor),
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: BlocBuilder<UserCardBloc, UserCardState>(
            builder: (context, state) {
              if (state is UserCardInitial || state is UserLoadingState) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                );
              }
              if (state is UserLoadedStete) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Expanded(
                      child: ListView.separated(
                    itemCount: state.userlist.length,
                    itemBuilder: (context, index) {
                      return UserCard(userModel: state.userlist[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  )),
                );
              }
              if (state is NoUserState || state is UserErrorState) {
                return Text(state.toString());
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
