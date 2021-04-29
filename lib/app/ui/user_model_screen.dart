import 'package:flutter/material.dart';
import 'package:model_classes/app/data/repo/user_repo.dart';
import 'package:model_classes/app/models/user_model.dart';

class UserModelScreen extends StatefulWidget {
  @override
  _UserModelScreenState createState() => _UserModelScreenState();
}

class _UserModelScreenState extends State<UserModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: userRepository.getUserModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserModelData> _user = snapshot.data.data;

            return ListView.builder(
              itemCount: _user.length,
              itemBuilder: (context, index) {
                return UserScreen(user: _user[index]);
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

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key key,
    @required UserModelData user,
  })  : _user = user,
        super(key: key);

  final UserModelData _user;

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
