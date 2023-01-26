import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/database/data.dart';
import 'package:pomodoro/app/database/db_pomodoro.dart';
import 'package:pomodoro/app/models/user.dart';

import './user_controller.dart';

class UserControllerImpl with ChangeNotifier implements UserController {
  String emailUser = '', userName = '';
  int idUser = 0;

  String get email => emailUser;
  String get user => userName;
  int get id => idUser;

  @override
  Future<void> deleteUser(int id) async {
    try {
      await DbPomodoro.db.delete('users', id);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final user = await DbPomodoro.db.getUser('users', email, password,);

      if (user.isEmpty) {
        return ;
      }

      final data = User.fromMap(user.first);

      Data.saveMap('userData', {
        'idUser': data.id,
        'userName': data.userName,
        'email': data.email,
      });

      emailUser = data.email;
      userName = data.userName;
      idUser = data.id!;

      NavigatorRoutes().homeScreen();
      
      log(user.toString());
    } on Exception catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  @override
  Future<void> logout() async {
    Data.remove('userData');
  }

  @override
  Future<void> registerUser(
      String email, String password, String userName) async {
        
    final user = User(userName: userName, email: email, password: password,);
    try {
      await DbPomodoro.db.insert('users', user.toMap());
      NavigatorRoutes().loginScreen();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> updateUser(
      String email, String password, String user, int id) async {
      
    final userData = User(userName: user, email: email, password: password);
    try {
      await DbPomodoro.db.update('users', id, userData.toMap());
      Data.saveMap('userData', {
        'idUser': id,
        'userName': user,
        'email': email,
      });

      emailUser = email;
      userName = user;
      idUser = id;
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<bool> isConnected() async {
    final user = await Data.getMap('userData');

    if (user.isEmpty) {
      return false;
    }

    final data = User.fromMap(user);

    emailUser = data.email;
    userName = data.userName;
    idUser = data.id!;

    notifyListeners();
    return true;
  }
}
