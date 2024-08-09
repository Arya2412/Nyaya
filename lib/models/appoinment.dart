import 'dart:convert';

class Appointment {
  final String id;
  final String userId;
  final String lawyerId;
  final DateTime dateTime;
  final String status;
  final String paymentStatus;

  Appointment({
    required this.id,
    required this.userId,
    required this.lawyerId,
    required this.dateTime,
    required this.status,
    required this.paymentStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'lawyerId': lawyerId,
      'dateTime': dateTime.toIso8601String(),
      'status': status,
      'paymentStatus': paymentStatus,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      lawyerId: map['lawyerId'] ?? '',
      dateTime: DateTime.parse(map['dateTime']),
      status: map['status'] ?? '',
      paymentStatus: map['paymentStatus'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) => Appointment.fromMap(json.decode(source));

  Appointment copyWith({
    String? id,
    String? userId,
    String? lawyerId,
    DateTime? dateTime,
    String? status,
    String? paymentStatus,
  }) {
    return Appointment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      lawyerId: lawyerId ?? this.lawyerId,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }
}
