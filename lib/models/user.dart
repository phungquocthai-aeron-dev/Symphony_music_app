class User {
  int userId;
  String fullname;
  String phone;
  String email;
  String password;
  DateTime dob;
  String gender;
  DateTime createdAt;
  String role;
  bool isActive;

  User({
    required this.userId,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.password,
    required this.dob,
    required this.gender,
    required this.createdAt,
    required this.role,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['user_id'],
    fullname: json['fullname'],
    phone: json['phone'],
    email: json['email'],
    password: json['password'],
    dob: DateTime.parse(json['dob']),
    gender: json['gender'],
    createdAt: DateTime.parse(json['created_at']),
    role: json['role'],
    isActive: json['is_active'],
  );

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'fullname': fullname,
    'phone': phone,
    'email': email,
    'password': password,
    'dob': dob.toIso8601String(),
    'gender': gender,
    'created_at': createdAt.toIso8601String(),
    'role': role,
    'is_active': isActive,
  };
}
