import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/user_controller_impl.dart';
import 'package:pomodoro/app/views/home_screen/home.dart';
import 'package:pomodoro/app/views/start_screen/start.dart';
import 'package:provider/provider.dart';

class AuthOrHome extends StatefulWidget {
  const AuthOrHome({Key? key}) : super(key: key);

  @override
  State<AuthOrHome> createState() => _AuthOrHomeState();
}

class _AuthOrHomeState extends State<AuthOrHome> {
  late final UserControllerImpl _future;

  @override
  void initState() {
    super.initState();   
   _future = Provider.of<UserControllerImpl>(context, listen: false); 
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: FutureBuilder(
          future: _future.isConnected(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.error != null) {
              return const Center(
                child: Text('Ocorreu um erro!'),
              );
            } else {
              return _future.isAuth ? const Home() : const Start();
            }
          },
        ),
      ),
    );
  }
}
