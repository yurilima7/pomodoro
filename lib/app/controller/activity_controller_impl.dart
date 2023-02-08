import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pomodoro/app/database/data.dart';
import 'package:pomodoro/app/database/db_pomodoro.dart';
import 'package:pomodoro/app/models/activity.dart';

import './activity_controller.dart';

class ActivityControllerImpl with ChangeNotifier implements ActivityController {
  List<Activity> _activities = [];
  List<Activity> get activities => [..._activities];

  @override
  Future<void> addActivity(
      String name, String focusTime, String breakTime, String breakActivity) async {

      final userData = await Data.getMap('userData');

      try {
        final activity = Activity(
          idUser: userData['id'],
          name: name,
          focusTime: focusTime,
          breakTime: breakTime,
          breakActivity: breakActivity,
        );

        await DbPomodoro.db.insert('activities', activity.toMap());
      } catch (e) {
        log(e.toString());
      }
  }

  @override
  Future<void> deleteActivity(int id) async {
    try {
      await DbPomodoro.db.delete('activities', id);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> loadActivity() async {
    try {
      final activities = await DbPomodoro.db.getData('activities');
      _activities = activities.map<Activity>((e) => Activity.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> updateActivity(
      String name, String focusTime, String breakTime, String breakActivity,
       int id) async {
    final userData = await Data.getMap('userData');

    try {
      final activity = Activity(
        idUser: userData['id'],
        name: name,
        focusTime: focusTime,
        breakTime: breakTime,
        breakActivity: breakActivity,
      );

      await DbPomodoro.db.update('activities', id, activity.toMap());
    } catch (e) {
      log(e.toString());
    }
  }
}
