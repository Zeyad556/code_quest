class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final String birth;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.birth,
  });

  Map<String, dynamic> toJson(SignUpModel userData) {
    return {
      'firstName': userData.firstName,
      'lastName': userData.lastName,
      'email': userData.email,
      'phone': userData.phone,
      'password': userData.password,
      'confirmPassword': userData.confirmPassword,
      'birth': userData.birth,
    };
  }
}
