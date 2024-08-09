import 'dart:convert';

class Lawyer {
  
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String specialization;
  final String experience;
  final String licenseNumber;
  final String token;
  final List<dynamic> meetings;
  final double rating;
  final int totalCases;
  final String profileImageUrl;

  Lawyer({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.specialization,
    required this.experience,
    required this.licenseNumber,
    required this.token,
    required this.meetings,
    required this.rating,
    required this.totalCases,
    required this.profileImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'specialization': specialization,
      'experience': experience,
      'licenseNumber': licenseNumber,
      'token': token,
      'meetings': meetings,
      'rating': rating,
      'totalCases': totalCases,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory Lawyer.fromMap(Map<String, dynamic> map) {
    return Lawyer(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      specialization: map['specialization'] ?? '',
      experience: map['experience'] ?? '',
      licenseNumber: map['licenseNumber'] ?? '',
      token: map['token'] ?? '',
      meetings: List<Map<String, dynamic>>.from(
        map['meetings']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
      rating: map['rating']?.toDouble() ?? 0.0,
      totalCases: map['totalCases']?.toInt() ?? 0,
      profileImageUrl: map['profileImageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Lawyer.fromJson(String source) => Lawyer.fromMap(json.decode(source));

  Lawyer copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? specialization,
    String? experience,
    String? licenseNumber,
    String? token,
    List<dynamic>? meetings,
    double? rating,
    int? totalCases,
    String? profileImageUrl,
  }) {
    return Lawyer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      specialization: specialization ?? this.specialization,
      experience: experience ?? this.experience,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      token: token ?? this.token,
      meetings: meetings ?? this.meetings,
      rating: rating ?? this.rating,
      totalCases: totalCases ?? this.totalCases,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
