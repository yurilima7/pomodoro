import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pomodoro/app/core/utils/navigator_routes.dart';
import 'package:pomodoro/app/database/data.dart';
import 'package:pomodoro/app/database/db_pomodoro.dart';
import 'package:pomodoro/app/models/user.dart';

import './user_controller.dart';

class UserControllerImpl with ChangeNotifier implements UserController {
  String _emailUser = '';
  String _userName = '';
  int  _idUser = 0;
  bool _auth = false;

  String get email => _emailUser;
  String get user => _userName;
  int get id => _idUser;
  bool get isAuth => _auth;

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
        'id': data.id,
        'userName': data.userName,
        'email': data.email,
      });

      _emailUser = data.email;
      _userName = data.userName;
       _idUser = data.id!;

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
        
    final userData = User(userName: userName, email: email, password: password,);
    try {
      await DbPomodoro.db.insert('users', userData.toMap());
      NavigatorRoutes().loginScreen();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> updateUser(
      String email, String password, String userName, int id) async {
      
    final userData = User(userName: userName, email: email, password: password);
    try {
      await DbPomodoro.db.update('users', id, userData.toMap());
      Data.saveMap('userData', {
        'id': id,
        'userName': userName,
        'email': email,
      });

      _emailUser = email;
      _userName = userName;
       _idUser = id;
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> isConnected() async {
    final userData = await Data.getMap('userData');

    if (userData.isEmpty) {
      return ;
    }

    _emailUser = userData['email'];
    _userName = userData['userName'];
    _idUser = userData['id'];
    _idUser > 0? _auth = true : _auth = false;

    notifyListeners(); 
  }
}
