import 'package:flutter/material.dart';
import 'package:model_classes/app/ui/user_data_2_screen.dart';
import 'package:model_classes/app/ui/user_data_screen.dart';
import 'package:model_classes/app/ui/user_model_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RouterScreen());
  }
}

class RouterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('User Model Screen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserModelScreen()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('User Model Data Screen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserModelDataScreen()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('User Model 2 Screen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserModel2Screen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
