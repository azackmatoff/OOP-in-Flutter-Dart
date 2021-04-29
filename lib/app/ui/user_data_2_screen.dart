import 'package:flutter/material.dart';
import 'package:model_classes/app/data/repo/user_repo.dart';
import 'package:model_classes/app/models/user_model_2.dart';

class UserModel2Screen extends StatefulWidget {
  @override
  _UserModel2ScreenState createState() => _UserModel2ScreenState();
}

class _UserModel2ScreenState extends State<UserModel2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModelData2>>(
        future: userRepository.getUserData2(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserModelData2> _user = snapshot.data;
            return ListView.builder(
              itemCount: _user.length,
              itemBuilder: (context, index) {
                return UserScreen2(user: _user[index]);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class UserScreen2 extends StatelessWidget {
  const UserScreen2({
    Key key,
    @required UserModelData2 user,
  })  : _user = user,
        super(key: key);

  final UserModelData2 _user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 25),
        Text("First Name: " + _user.firstName),
        SizedBox(height: 5),
        Text("email: " + _user.email),
        Container(
          height: 200,
          width: 400,
          child: Image.network(_user.avatar),
        ),
      ],
    );
  }
}
