class PatientModel {
  late String patientId;
  late String patientName;
  late int patientScore;

  PatientModel({
    required this.patientId,
    required this.patientName,
    required this.patientScore,
  });

  static PatientModel fromMap(Map<String, dynamic> map) {
    return PatientModel(
        patientId: map['patientId'],
        patientName: map['patientName'],
        patientScore: map['patientScore']);
  }

  /*static TaskModel fromJson(Map<String, dynamic> json) => TaskModel(
     taskId: json['taskId'],
     taskName: json['taskName'],
     dt: json['dt']
   );*/
}
