import 'package:flutter/material.dart';
import 'package:model_classes/app/data/repo/user_repo.dart';
import 'package:model_classes/app/models/user_model.dart';
import 'package:model_classes/app/ui/user_model_screen.dart';

class UserModelDataScreen extends StatefulWidget {
  @override
  _UserModelDataScreenState createState() => _UserModelDataScreenState();
}

class _UserModelDataScreenState extends State<UserModelDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModelData>>(
        future: userRepository.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserModelData> _user = snapshot.data;
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
