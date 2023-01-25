class Activity {
  final int? id;
  final int idUser;
  final String name;
  final String focusTime;
  final String breakTime;
  final String breakActivity;

  Activity({
    this.id,
    required this.idUser,
    required this.name,
    required this.focusTime,
    required this.breakTime,
    required this.breakActivity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'name': name,
      'focusTime': focusTime,
      'breakTime': breakTime,
      'breakActivity': breakActivity
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] as int,
      idUser: map['idUser'] as int,
      name: map['name'] as String,
      focusTime: map['focusTime'] as String,
      breakTime: map['breakTime'] as String,
      breakActivity: map['breakActivity'] as String,
    );
  }
}
