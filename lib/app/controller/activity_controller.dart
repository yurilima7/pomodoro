abstract class ActivityController {
  Future<void> addActivity(
      String name, String focusTime, String breakTime, String breakActivity);
  Future<void> updateActivity(
      String name, String focusTime, String breakTime, String breakActivity, int id);
  Future<void> loadActivity();
  Future<void> deleteActivity(int id);
}